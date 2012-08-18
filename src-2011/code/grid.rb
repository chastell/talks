grid = ARGV.first.to_i

puts (0...2**(2 * grid))
.map { |n| n.to_s 2 }
.map { |s| s.rjust 2 * grid, '0' }
.select { |s| s.count('1') == s.count('0') }
.size
