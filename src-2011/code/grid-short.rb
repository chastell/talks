grid = ARGV.first.to_i

puts (0...2**(2 * grid))
.count { |n| n.to_s(2).count('1') == grid }
