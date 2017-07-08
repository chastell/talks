require 'benchmark/ips'
require 'cgi'
unless RUBY_ENGINE == 'jruby'
  require 'helix_runtime'
  require_relative './polyconf_rust/lib/polyconf_rust/native'
end

class String
  ENTITIES = { '<' => '&lt;', '>' => '&gt;', '&' => '&amp;',
               "'" => '&apos;', '"' => '&quot;' }

  def escape_cgi
    CGI.escape_html(self)
  end

  def escape_each_char
    ''.tap do |result|
      each_char { |char| result << ENTITIES.fetch(char, char) }
    end
  end

  def escape_gsub
    gsub(/[<>&'"]/, ENTITIES)
  end

  def escape_rust_map
    HTML.map_escape(self)
  end unless RUBY_ENGINE == 'jruby'

  def escape_rust_push
    HTML.push_escape(self)
  end unless RUBY_ENGINE == 'jruby'
end

string  = '<script>alert("boo!")</script>' * 42
methods = String.instance_methods.grep(/^escape_/).sort

raise 'oops' unless methods.map { |meth| string.public_send(meth) }.uniq.size == 1

Benchmark.ips do |bench|
  bench.warmup = 30
  bench.time   = 30
  methods.each do |meth|
    bench.report(meth[7..-1]) { string.public_send(meth) }
  end
  bench.compare!
end
