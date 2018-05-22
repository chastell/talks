require "benchmark"
require "html"

class String
  ENTITIES = { '<' => "&lt;", '>' => "&gt;", '&' => "&amp;",
               '\'' => "&apos;", '"' => "&quot;" }

  def escape_gsub
    gsub(ENTITIES)
  end

  def escape_html
    HTML.escape(self)
  end

  def escape_io
    io = IO::Memory.new
    HTML.escape(self, io)
    io.to_s
  end
end

string = "<script>alert('boo!')</script>" * 42

Benchmark.ips do |bench|
  bench.report("io")   { string.escape_io   }
  bench.report("gsub") { string.escape_gsub }
  bench.report("html") { string.escape_html }
end
