# binary representation

* let’s have a set of elements (e.g., integers)
<!-- .element: class="fragment" -->
* let’s represent it by ‘set’ bits<br />(ones in its binary representation)
<!-- .element: class="fragment" -->
* <span class="fragment">`{0,2,3,5} → 0b101101`</span>
* set operations are now binary operations
<!-- .element: class="fragment" -->
* <span class="fragment">`{0,2,3,5} ∩ {2,3,4} → 0b101101 & 0b011100`</span>
* <span class="fragment">`0b101101 & 0b011100 → 0b001100 → {2,3}`</span>


# population count

* let’s say we need the size of our set
<!-- .element: class="fragment" -->
* number of ones in binary representation
<!-- .element: class="fragment" -->
* <code class="fragment">|{0,2,3,5}| → popcount(0b101101) → 4</code>
* <code class="fragment">&nbsp; |{2,3,4}| → popcount(0b011100) → 3</code>
* <code class="fragment">&nbsp; &nbsp; |{2,3}| → popcount(0b001100) → 2</code>


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
    until number.zero?
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
    until number.zero?
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


# Rust via Helix? sure!

```rust
#[macro_use]
extern crate helix;

ruby! {
    class Popcount {
        def count(int: u64) -> u32 {
            int.count_ones()
        }
    }
}
```


## C? SSE4.2? why not!

```ruby
class Integer
```

```ruby
  inline do |builder|
    builder.c 'int popcount_bit_elim_c() {
      long number = NUM2LONG(self);
      int  count;
      for (count = 0; number; count++) number &= number - 1;
      return count;
    }'
  end
```

```ruby
  inline do |builder|
    builder.c 'int popcount_builtin() {
      return __builtin_popcountl(NUM2LONG(self));
    }'
  end
```
<!-- .element: class="fragment" -->

```ruby
end
```


## algorithms? approach!

```ruby
class Integer
```

```ruby
  POPCOUNT_CACHE = (0x0000..0xffff).map { |number| number.to_s(2).count('1') }
```

```ruby
  def popcount_cached
    POPCOUNT_CACHE[self & 0xffff] +
    POPCOUNT_CACHE[self >> 16 & 0xffff] +
    POPCOUNT_CACHE[self >> 32 & 0xffff] +
    POPCOUNT_CACHE[self >> 48]
  end
```
<!-- .element: class="fragment" -->

```ruby
end
```


## let’s bench! that introspection!

```ruby
require 'benchmark/ips'
```

```ruby
numbers = Array.new(1_000) { rand(2**62) }
methods = Integer.instance_methods.grep(/^popcount_/)
```

```ruby
raise 'oops' unless methods.map { |meth| numbers.map(&meth) }.uniq.size == 1
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
Ruby 2.4:
             builtin:    29436.7 i/s
          bit_elim_c:    16867.7 i/s - 1.75x  slower
              cached:     5111.6 i/s - 5.76x  slower
                rust:     3391.8 i/s - 8.68x  slower
          prog_shift:     2926.2 i/s - 10.06x  slower
                to_s:     1159.7 i/s - 25.38x  slower
            bit_elim:      742.4 i/s - 39.65x  slower
          cont_shift:      313.7 i/s - 93.85x  slower
```

```nohighlight

JRuby 9.1:
              cached:     5442.7 i/s
          prog_shift:     4429.8 i/s - 1.23x  slower
            bit_elim:     1320.6 i/s - 4.12x  slower
                to_s:      843.4 i/s - 6.45x  slower
          cont_shift:      658.3 i/s - 8.27x  slower
```
<!-- .element: class="fragment" -->


```crystal
require "benchmark"

struct Int
  POPCOUNT_CACHE = (0x0000..0xffff).map { |number| number.to_s(2).count('1') }
  def popcount_bit_elim   # …
  def popcount_cached     # …
  def popcount_cont_shift # …
  def popcount_prog_shift # …
  def popcount_to_s       # …
end

numbers = Array.new(1_000) { rand(2u64**62) }

Benchmark.ips do |bench|
  bench.report("popcount")   { numbers.map(&.popcount)            }
  bench.report("prog_shift") { numbers.map(&.popcount_prog_shift) }
  bench.report("cached")     { numbers.map(&.popcount_cached)     }
  bench.report("bit_elim")   { numbers.map(&.popcount_bit_elim)   }
  bench.report("cont_shift") { numbers.map(&.popcount_cont_shift) }
  bench.report("to_s")       { numbers.map(&.popcount_to_s)       }
end
```


* ⚠ Ruby times include Ruby-side call overhead ⚠

```nohighlight
Ruby 2.4 (+ Rust, C, SSE4.2…):
             builtin:    29436.7 i/s
          bit_elim_c:    16867.7 i/s - 1.75x  slower
              cached:     5111.6 i/s - 5.76x  slower
                rust:     3391.8 i/s - 8.68x  slower
          prog_shift:     2926.2 i/s - 10.06x  slower
                to_s:     1159.7 i/s - 25.38x  slower
            bit_elim:      742.4 i/s - 39.65x  slower
          cont_shift:      313.7 i/s - 93.85x  slower
```
<!-- .element: class="fragment" -->

```nohighlight

Crystal 0.23 (pure):
  popcount 188.27k (  5.31µs) (± 1.52%)        fastest
prog_shift  150.6k (  6.64µs) (± 1.39%)   1.25× slower
    cached  117.4k (  8.52µs) (± 0.59%)   1.60× slower
  bit_elim  30.72k ( 32.55µs) (± 2.43%)   6.13× slower
cont_shift  23.97k ( 41.71µs) (± 1.53%)   7.85× slower
      to_s   1.27k ( 785.6µs) (± 1.26%) 147.91× slower
```
<!-- .element: class="fragment" -->


[![cookie](img/cookie.png)](https://twitter.com/HiddenPinky/status/482276202539794433)
