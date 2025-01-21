require 'minitest/autorun'
require 'minitest/benchmark'
require 'minitest/pride'

describe '#found?' do
  it 'is a predicate wheter the list includes the number' do
    list = [2, 3, 5, 7, 9, 100]
    assert list.all? { |number| found?(list:, number:) }
    excl = (0..101).to_a - list
    assert excl.none? { |number| found?(list:, number:) }
  end

  it 'works with large numbers' do
    list = [1, 2, 1_000_000]
    assert list.all? { |number| found?(list:, number:) }
    refute found?(list:, number: 999_999)
  end

  it 'works with large lists' do
    list = (1..1_000_000).to_a
    assert found?(list:, number: 999_999)
  end
end

describe 'FinderBenchmark' do
  bench_range { bench_exp(1, 10_000) }

  Scenario = Data.define(:list, :number) { alias_method :to_hash, :to_h }

  def setup
    @scenarios = self.class.bench_range.map do |bench|
      { bench => Scenario.new(list: (1..bench).to_a, number: bench / 2 ) }
    end.reduce(:merge)
  end

  bench_performance_logarithmic 'logarithmic' do |bench|
    scenario = @scenarios.fetch(bench)
    100_000.times { found?(**scenario) }
  end
end

def found?(list:, number:)
  return false if list.empty?
  return false if number < list.first
  return false if number > list.last
  return true  if number == list.first
  return true  if number == list.last

  index = 1
  index += index while index + index < list.size

  case number <=> list[index]
  when -1 then found?(list: list[...index], number:)
  when  0 then true
  when  1 then found?(list: list[index..], number:)
  end
end

def found?(list:, number:) = list.include?(number)
