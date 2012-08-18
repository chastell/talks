require 'inline'

class Integer
  inline do |builder|
    builder.c '
      int popcount_bitshift_c() {
        long number = NUM2LONG(self);
        int count;
        for (count = 0; number; count++) number &= number - 1;
        return count;
      }
    '
  end
end

grid = ARGV.first.to_i
puts (0...2**(2 * grid)).count { |n| n.popcount_bitshift_c == grid }
