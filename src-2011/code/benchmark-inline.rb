require 'benchmark'
require 'prime'
require './euler-primes'

Benchmark.bmbm do |bench|
  bench.report 'simple:' do
    (2..100_000).each { |i| i.simple_prime? }
  end
  bench.report 'clever:' do
    (2..100_000).each { |i| i.clever_prime? }
  end
  bench.report 'stdlib:' do
    (2..100_000).each { |i| i.prime? }
  end
  bench.report 'inline:' do
    (2..100_000).each { |i| i.inline_clever }
  end
end
