!SLIDE bullets center

* <span class='quote'>This makes me happy: 357686312646216567629137 is prime<br />and remains so after removing<br />any number of digits from the left.<br />— wallingf</span>

!SLIDE

```ruby
class Integer
  def simple_prime?

  end
end
```

!SLIDE

```ruby
class Integer
  def simple_prime?
    (2..          self       )
  end
end
```

!SLIDE

```ruby
class Integer
  def simple_prime?
    (2..Math.sqrt(self)      )
  end
end
```

!SLIDE

```ruby
class Integer
  def simple_prime?
    (2..Math.sqrt(self).floor)
  end
end
```

!SLIDE

```ruby
class Integer
  def simple_prime?
    (2..Math.sqrt(self).floor).all? { |i| (self % i).nonzero? }
  end
end
```

!SLIDE

```ruby
class Integer
  def simple_prime?
    (2..Math.sqrt(self).floor).all? { |i| (self % i).nonzero? }
  end
end

7.simple_prime?                          #=> true
```

!SLIDE

```ruby
class Integer
  def simple_prime?
    (2..Math.sqrt(self).floor).all? { |i| (self % i).nonzero? }
  end
end

7.simple_prime?                          #=> true
37.simple_prime?                         #=> true
```

!SLIDE

```ruby
class Integer
  def simple_prime?
    (2..Math.sqrt(self).floor).all? { |i| (self % i).nonzero? }
  end
end

7.simple_prime?                          #=> true
37.simple_prime?                         #=> true
137.simple_prime?                        #=> true
```

!SLIDE

```ruby
class Integer
  def simple_prime?
    (2..Math.sqrt(self).floor).all? { |i| (self % i).nonzero? }
  end
end

7.simple_prime?                          #=> true
37.simple_prime?                         #=> true
137.simple_prime?                        #=> true
9137.simple_prime?                       #=> true
29137.simple_prime?                      #=> true
629137.simple_prime?                     #=> true
7629137.simple_prime?                    #=> true
67629137.simple_prime?                   #=> true
567629137.simple_prime?                  #=> true
6567629137.simple_prime?                 #=> true
16567629137.simple_prime?                #=> true
216567629137.simple_prime?               #=> true
6216567629137.simple_prime?              #=> true
46216567629137.simple_prime?             #=> true
646216567629137.simple_prime?            #=> true
2646216567629137.simple_prime?           #=> true
```

!SLIDE

```ruby
class Integer
  def simple_prime?
    (2..Math.sqrt(self).floor).all? { |i| (self % i).nonzero? }
  end
end

7.simple_prime?                          #=> true
37.simple_prime?                         #=> true
137.simple_prime?                        #=> true
9137.simple_prime?                       #=> true
29137.simple_prime?                      #=> true
629137.simple_prime?                     #=> true
7629137.simple_prime?                    #=> true
67629137.simple_prime?                   #=> true
567629137.simple_prime?                  #=> true
6567629137.simple_prime?                 #=> true
16567629137.simple_prime?                #=> true
216567629137.simple_prime?               #=> true
6216567629137.simple_prime?              #=> true
46216567629137.simple_prime?             #=> true
646216567629137.simple_prime?            #=> true
2646216567629137.simple_prime?           #=> true

357686312646216567629137.simple_prime?   #=> heat death of the universe
```

!SLIDE

```ruby
class Integer
  def clever_prime?



  end
end
```

!SLIDE

```ruby
class Integer
  def clever_prime?

    return false if self.even?

  end
end
```

!SLIDE

```ruby
class Integer
  def clever_prime?
    return true  if self == 2
    return false if self.even?

  end
end
```

!SLIDE

```ruby
class Integer
  def clever_prime?
    return true  if self == 2
    return false if self.even?
    3.step(Math.sqrt(self).floor, 2)
  end
end
```

!SLIDE

```ruby
class Integer
  def clever_prime?
    return true  if self == 2
    return false if self.even?
    3.step(Math.sqrt(self).floor, 2).all? { |i| (self % i).nonzero? }
  end
end
```

!SLIDE

```ruby
class Integer
  def clever_prime?
    return true  if self == 2
    return false if self.even?
    3.step(Math.sqrt(self).floor, 2).all? { |i| (self % i).nonzero? }
  end
end

646216567629137.clever_prime?            #=> true
2646216567629137.clever_prime?           #=> true
12646216567629137.clever_prime?          #=> true
```

!SLIDE

```ruby
class Integer
  def clever_prime?
    return true  if self == 2
    return false if self.even?
    3.step(Math.sqrt(self).floor, 2).all? { |i| (self % i).nonzero? }
  end
end

646216567629137.clever_prime?            #=> true
2646216567629137.clever_prime?           #=> true
12646216567629137.clever_prime?          #=> true

357686312646216567629137.clever_prime?   #=> heat death of the universe
```

!SLIDE

```ruby
class Integer
  def clever_prime?
    return true  if self == 2
    return false if self.even?
    3.step(Math.sqrt(self).floor, 2).all? { |i| (self % i).nonzero? }
  end
end

646216567629137.clever_prime?            #=> true
2646216567629137.clever_prime?           #=> true
12646216567629137.clever_prime?          #=> true

357686312646216567629137.clever_prime?   #=> heat death of the universe

require 'prime'

12646216567629137.prime?                 #=> true, but takes surprisingly long
```
