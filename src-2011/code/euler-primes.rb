require 'inline'

class Integer

  def stupid_prime?
    prime = true
    (2...self).each { |i| prime = false if (self % i).zero? }
    prime
  end

  def tedious_prime?
    (2...self).all? { |i| (self % i).nonzero? }
  end

  def simple_prime?
    (2..Math.sqrt(self).floor).all? { |i| (self % i).nonzero? }
  end

  def clever_prime?
    return true  if self == 2
    return false if self.even?
    3.step(Math.sqrt(self).floor, 2).all? { |i| (self % i).nonzero? }
  end

  inline do |builder|
    builder.c '
      VALUE inline_simple() {
        long number = NUM2LONG(self);
        long i;
        for (i = 2; i <= floor(sqrt(number)); i++) {
          if (number % i == 0) return Qfalse;
        }
        return Qtrue;
      }
    '
  end

  inline do |builder|
    builder.c '
      VALUE inline_clever() {
        long number = NUM2LONG(self);
        if (number == 2)     return Qtrue;
        if (number % 2 == 0) return Qfalse;
        long i;
        for (i = 3; i <= floor(sqrt(number)); i = i + 2) {
          if (number % i == 0) return Qfalse;
        }
        return Qtrue;
      }
    '
  end

end
