require 'inline'

class Integer

  inline do |builder|
    builder.c '
      int popcount_builtin() {
        return __builtin_popcountl(NUM2LONG(self));
      }
    '
  end

end

grid = ARGV.first.to_i

puts (0...2**(2 * grid)).count { |n| n.popcount_builtin == grid }
