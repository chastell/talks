class Integer

  def popcount_to_s
    to_s(2).count '1'
  end

end

grid = ARGV.first.to_i

puts (0...2**(2 * grid))
.count { |n| n.popcount_to_s == grid }
