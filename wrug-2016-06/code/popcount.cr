require "benchmark"

struct Int
  POPCOUNT_CACHE = (0x0000..0xffff).map { |number| number.to_s(2).count('1') }

  def popcount_bit_elim
    count  = 0
    number = self
    while number != 0
      number &= number - 1
      count += 1
    end
    count
  end

  def popcount_cached
    POPCOUNT_CACHE[self & 0xffff] +
    POPCOUNT_CACHE[self >> 16 & 0xffff] +
    POPCOUNT_CACHE[self >> 32 & 0xffff] +
    POPCOUNT_CACHE[self >> 48]
  end

  def popcount_cont_shift
    count  = 0
    number = self
    until number == 0
      count += number & 1
      number >>= 1
    end
    count
  end

  def popcount_prog_shift
    number = self
    number -= (number >> 1) & 0x5555555555555555
    number = (number & 0x3333333333333333) + ((number >> 2) & 0x3333333333333333)
    number = (number + (number >>  4)) & 0x0f0f0f0f0f0f0f0f
    number = (number + (number >>  8)) & 0x00ff00ff00ff00ff
    number = (number + (number >> 16)) & 0x0000ffff0000ffff
    number += number >> 32
    (number + (number >> 64)) & 0xff
  end

  def popcount_to_s
    to_s(2).count('1')
  end
end

numbers = Array.new(1_000) { rand(0...(2**62-1)) }

Benchmark.ips do |bench|
  bench.report("popcount")   { numbers.map(&.popcount)            }
  bench.report("prog_shift") { numbers.map(&.popcount_prog_shift) }
  bench.report("cached")     { numbers.map(&.popcount_cached)     }
  bench.report("bit_elim")   { numbers.map(&.popcount_bit_elim)   }
  bench.report("cont_shift") { numbers.map(&.popcount_cont_shift) }
  bench.report("to_s")       { numbers.map(&.popcount_to_s)       }
end
