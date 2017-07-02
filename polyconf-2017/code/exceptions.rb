require 'active_record'
require 'benchmark/ips'

puts "Ruby #{RUBY_VERSION} + Active Record #{ActiveRecord::VERSION::STRING}"

ActiveRecord::Base.establish_connection adapter: 'postgresql'

class CreateWhatevers < ActiveRecord::Migration[5.1]
  def change
    create_table(:whatevers) { |table| table.text :text }
  end
end

CreateWhatevers.migrate :up
at_exit { CreateWhatevers.migrate :down }

Whatever = Class.new(ActiveRecord::Base)

Benchmark.ips do |bench|
  bench.report('exception miss') { raise '💥' if false          }
  bench.report('exception hit')  { raise '💥' rescue nil        }
  bench.report('SELECT')         { Whatever.first               }
  bench.report('INSERT')         { Whatever.create(text: 'meh') }
  bench.compare!
end
