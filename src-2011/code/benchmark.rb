require 'benchmark'
require './euler-primes'
require 'prime'

Benchmark.bmbm do |bench|
  bench.report 'stupid:' do
    (2..10_000).each { |i| i.stupid_prime? }
  end
  bench.report 'tedious:' do
    (2..10_000).each { |i| i.tedious_prime? }
  end
  bench.report 'simple:' do
    (2..10_000).each { |i| i.simple_prime? }
  end
  bench.report 'clever:' do
    (2..10_000).each { |i| i.clever_prime? }
  end
  bench.report 'stdlib:' do
    (2..10_000).each { |i| i.prime? }
  end
end
