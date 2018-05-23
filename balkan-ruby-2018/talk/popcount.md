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
Ruby 2.5:
             builtin:    29915.7 i/s
          bit_elim_c:    17011.6 i/s - 1.76x  slower
              cached:     4874.4 i/s - 6.14x  slower
                rust:     3133.3 i/s - 9.55x  slower
          prog_shift:     2878.5 i/s - 10.39x  slower
                to_s:     1131.3 i/s - 26.44x  slower
            bit_elim:      714.5 i/s - 41.87x  slower
          cont_shift:      317.3 i/s - 94.27x  slower
```

```nohighlight

JRuby 9.1:
              cached:     5700.0 i/s
          prog_shift:     4894.2 i/s - 1.16x  slower
            bit_elim:     1337.3 i/s - 4.26x  slower
                to_s:      870.2 i/s - 6.55x  slower
          cont_shift:      716.2 i/s - 7.96x  slower
```
<!-- .element: class="fragment" -->

```nohighlight

JRuby 9.1 + 30 s warm-up + invoke dynamic:
          prog_shift:     6749.9 i/s
              cached:     6566.6 i/s - same-ish: difference falls within error
            bit_elim:     2587.5 i/s - 2.61x  slower
          cont_shift:     1644.5 i/s - 4.10x  slower
                to_s:      855.6 i/s - 7.89x  slower
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
Ruby 2.5 (+ Rust, C, SSE4.2…):
             builtin:    29915.7 i/s
          bit_elim_c:    17011.6 i/s - 1.76x  slower
              cached:     4874.4 i/s - 6.14x  slower
                rust:     3133.3 i/s - 9.55x  slower
          prog_shift:     2878.5 i/s - 10.39x  slower
                to_s:     1131.3 i/s - 26.44x  slower
            bit_elim:      714.5 i/s - 41.87x  slower
          cont_shift:      317.3 i/s - 94.27x  slower
```

```nohighlight

Crystal 0.24:
  popcount 184.26k (  5.43µs) (± 0.61%)       fastest
prog_shift 148.72k (  6.72µs) (± 1.54%)  1.24× slower
    cached 120.57k (  8.29µs) (± 1.08%)  1.53× slower
  bit_elim  31.87k ( 31.38µs) (± 1.94%)  5.78× slower
cont_shift  23.73k ( 42.14µs) (± 1.53%)  7.76× slower
      to_s   6.47k (154.45µs) (± 0.74%) 28.46× slower
```
<!-- .element: class="fragment" -->


[![cookie](img/cookie.png)](https://twitter.com/HiddenPinky/status/482276202539794433)
