require 'benchmark/ips'
require 'inline'

class Integer
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

  def popcount_scan_regexp
    to_s(2).scan(/1/).size
  end

  def popcount_scan_string
    to_s(2).scan('1').size
  end

  def popcount_to_s
    to_s(2).count('1')
  end

  inline do |builder|
    builder.c '
      int popcount_bit_elim_c() {
        long number = NUM2LONG(self);
        int  count;
        for (count = 0; number; count++) number &= number - 1;
        return count;
      }
    '

    builder.c '
      int popcount_builtin() {
        return __builtin_popcountl(NUM2LONG(self));
      }
    '
  end
end

methods = Integer.instance_methods.grep(/^popcount_/)
numbers = Array.new(1_000) { rand(0...(2**62-1)) }

fail 'oops' unless methods.map { |meth| numbers.map(&meth) }.uniq.size == 1

Benchmark.ips do |bench|
  methods.each do |meth|
    bench.report(meth[9..-1]) { numbers.map(&meth) }
  end
  bench.compare!
end
