## so… how many go to each conf?

```ruby
eurucamp = matrix[confs.index('eurucamp')]   #=> [true, true, true, false, true]
eurucamp.count(true)                         #=> 4
```
<!-- .element: class="fragment" -->

```ruby
eurucamp = matrix[confs.index('eurucamp')]   #=> 0b11101
eurucamp.to_s(2).count('1')                  #=> 4
```
<!-- .element: class="fragment" -->

* number of ones in a binary representation
<!-- .element: class="fragment" -->

* ‘population count’
<!-- .element: class="fragment" -->

* but `to_s(2).count('1')` is not _very_ efficient
<!-- .element: class="fragment" -->


## let’s freedom-patch `Integer`

```ruby
class Integer
```

```ruby
  def popcount_to_s
    to_s(2).count('1')
  end
```

```ruby
  def popcount_cont_shift
    count  = 0
    number = self
    until number == 0
      count += number & 1
      number >>= 1
    end
    count
  end
```
<!-- .element: class="fragment" -->

```ruby
end
```


```ruby
class Integer
```

```ruby
  def popcount_bit_elim
    count  = 0
    number = self
    while number != 0
      number &= number - 1
      count += 1
    end
    count
  end
```

```ruby
  def popcount_prog_shift
    number  = self
    number -= (number >> 1) & 0x5555555555555555
    number  = (number & 0x3333333333333333) + ((number >> 2) & 0x3333333333333333)
    number  = (number + (number >>  4)) & 0x0f0f0f0f0f0f0f0f
    number  = (number + (number >>  8)) & 0x00ff00ff00ff00ff
    number  = (number + (number >> 16)) & 0x0000ffff0000ffff
    number += number >> 32
    (number + (number >> 64)) & 0xff
  end
```
<!-- .element: class="fragment" -->

```ruby
end
```


```ruby
require 'inline'

class Integer
```

```ruby
  inline do |builder|
    builder.c '
      int popcount_bit_elim_c() {
        long number = NUM2LONG(self);
        int  count;
        for (count = 0; number; count++) number &= number - 1;
        return count;
      }
    '
  end
```

```ruby
  inline do |builder|
    builder.c '
      int popcount_builtin() {
        return __builtin_popcountl(NUM2LONG(self));
      }
    '
  end
```
<!-- .element: class="fragment" -->

```ruby
end
```


```ruby
class Integer
```

```ruby
  POPCOUNT_CACHE = (0x0000..0xffff).map { |number| number.to_s(2).count('1') }

  def popcount_cached
    POPCOUNT_CACHE[self & 0xffff] +
    POPCOUNT_CACHE[self >> 16 & 0xffff] +
    POPCOUNT_CACHE[self >> 32 & 0xffff] +
    POPCOUNT_CACHE[self >> 48]
  end
```

```ruby
end
```


```ruby
require 'benchmark/ips'
```

```ruby
methods = Integer.instance_methods.grep(/^popcount_/)
numbers = Array.new(1_000) { rand(0...(2**62-1)) }
```

```ruby
fail 'oops' unless methods.map { |meth| numbers.map(&meth) }.uniq.size == 1
```
<!-- .element: class="fragment" -->

```ruby
Benchmark.ips do |bench|
  methods.each do |meth|
    bench.report(meth[9..-1]) { numbers.map(&meth) }
  end
  bench.compare!
end
```
<!-- .element: class="fragment" -->


```nohighlight
Warming up --------------------------------------
            bit_elim    73.000  i/100ms
              cached   454.000  i/100ms
          cont_shift    34.000  i/100ms
          prog_shift   265.000  i/100ms
                to_s    81.000  i/100ms
          bit_elim_c     1.408k i/100ms
             builtin     2.164k i/100ms
Calculating -------------------------------------
            bit_elim    752.707  (± 0.1%) i/s -      3.796k in   5.043150s
              cached      4.613k (± 0.7%) i/s -     23.154k in   5.019724s
          cont_shift    347.148  (± 1.2%) i/s -      1.768k in   5.093777s
          prog_shift      2.632k (± 2.3%) i/s -     13.250k in   5.037368s
                to_s    815.852  (± 0.9%) i/s -      4.131k in   5.063780s
          bit_elim_c     14.339k (± 1.1%) i/s -     71.808k in   5.008502s
             builtin     22.184k (± 1.4%) i/s -    112.528k in   5.073427s
```

```nohighlight
Comparison:
             builtin:    22184.1 i/s
          bit_elim_c:    14339.1 i/s - 1.55x slower
              cached:     4612.9 i/s - 4.81x slower
          prog_shift:     2631.8 i/s - 8.43x slower
                to_s:      815.9 i/s - 27.19x slower
            bit_elim:      752.7 i/s - 29.47x slower
          cont_shift:      347.1 i/s - 63.90x slower
```
<!-- .element: class="fragment" -->
