require 'benchmark'
require 'prime'

class Integer
  def sqrt_prime?
    (2..Math.sqrt(self).floor).all? { |i| (self % i).nonzero? }
  end

  def skipping_prime?
    return true  if self == 2
    return false if self.even?
    3.step(Math.sqrt(self).floor, 2).all? { |i| (self % i).nonzero? }
  end
end

range = 2..1_000_000

Benchmark.bmbm do |bench|
  bench.report('sqrt:')     { range.each &:sqrt_prime?     }
  bench.report('skipping:') { range.each &:skipping_prime? }
  bench.report('stdlib:')   { range.each &:prime?          }
end
