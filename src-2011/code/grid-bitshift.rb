class Integer

  def popcount_bitshift
    count = 0
    number = self
    while number > 0
      number &= number - 1
      count += 1
    end
    count
  end

end

grid = ARGV.first.to_i

puts (0...2**(2 * grid)).count { |n| n.popcount_bitshift == grid }
