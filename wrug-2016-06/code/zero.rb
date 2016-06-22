require 'benchmark/ips'

numbers = Array.new(1_000) { rand(1..1_000) }

Benchmark.ips do |bench|
  bench.report('==') { numbers.map { |n| n == 0 } }
  bench.report('.zero?') { numbers.map { |n| n.zero? } }
  bench.report('&:zero?') { numbers.map(&:zero?) }
  bench.compare!
end
