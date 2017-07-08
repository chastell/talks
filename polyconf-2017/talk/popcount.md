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
             builtin:    29685.6 i/s
          bit_elim_c:    17043.8 i/s - 1.74x  slower
              cached:     5087.7 i/s - 5.83x  slower
                rust:     3487.7 i/s - 8.51x  slower
          prog_shift:     2951.5 i/s - 10.06x  slower
                to_s:     1140.3 i/s - 26.03x  slower
            bit_elim:      732.6 i/s - 40.52x  slower
          cont_shift:      310.2 i/s - 95.68x  slower
```

```nohighlight

JRuby 9.1:
              cached:     5288.3 i/s
          prog_shift:     4090.0 i/s - 1.29x  slower
            bit_elim:     1310.2 i/s - 4.04x  slower
                to_s:      856.5 i/s - 6.17x  slower
          cont_shift:      695.5 i/s - 7.60x  slower
```
<!-- .element: class="fragment" -->

```nohighlight

JRuby 9.1 + 30 s warm-up + invoke dynamic:
          prog_shift:     6965.5 i/s
              cached:     6953.2 i/s - same-ish: difference falls within error
          cont_shift:     1703.5 i/s - 4.09x  slower
            bit_elim:     1665.5 i/s - 4.18x  slower
                to_s:      870.8 i/s - 8.00x  slower
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
             builtin:    29685.6 i/s
          bit_elim_c:    17043.8 i/s - 1.74x  slower
              cached:     5087.7 i/s - 5.83x  slower
                rust:     3487.7 i/s - 8.51x  slower
          prog_shift:     2951.5 i/s - 10.06x  slower
                to_s:     1140.3 i/s - 26.03x  slower
            bit_elim:      732.6 i/s - 40.52x  slower
          cont_shift:      310.2 i/s - 95.68x  slower
```
<!-- .element: class="fragment" -->

```nohighlight

Crystal 0.23 (pure):
  popcount 256.59k (   3.9µs) (± 0.47%)       fastest
prog_shift 203.25k (  4.92µs) (± 0.31%)  1.26× slower
    cached 160.32k (  6.24µs) (± 0.63%)  1.60× slower
  bit_elim  31.98k ( 31.27µs) (± 0.29%)  8.02× slower
cont_shift  23.97k ( 41.72µs) (± 1.44%) 10.71× slower
      to_s   8.13k (122.99µs) (± 0.79%) 31.56× slower
```
<!-- .element: class="fragment" -->


[![cookie](img/cookie.png)](https://twitter.com/HiddenPinky/status/482276202539794433)
