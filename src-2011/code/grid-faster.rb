require 'inline'

class Integer

  def popcount_to_s
    to_s(2).count '1'
  end

  def popcount_bitshift
    count = 0
    number = self
    while number > 0
      number &= number - 1
      count += 1
    end
    count
  end

  inline do |builder|
    builder.c '
      int popcount_builtin() {
        return __builtin_popcountl(NUM2LONG(self));
      }
    '
    builder.c '
      long popcount_bitshift_c() {
        long number = NUM2LONG(self);
        long count = 0;
        while (number) {
          number &= number - 1;
          count++;
        }
        return count;
      }
    '
  end

end

grid = ARGV.first.to_i

puts (0...2**(2 * grid))
.count { |n| n.popcount_builtin == grid }
