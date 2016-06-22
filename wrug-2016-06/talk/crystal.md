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

numbers = Array.new(1_000) { rand(0...(2**62-1)) }

Benchmark.ips do |bench|
  bench.report("popcount")   { numbers.map(&.popcount)            }
  bench.report("prog_shift") { numbers.map(&.popcount_prog_shift) }
  bench.report("cached")     { numbers.map(&.popcount_cached)     }
  bench.report("bit_elim")   { numbers.map(&.popcount_bit_elim)   }
  bench.report("cont_shift") { numbers.map(&.popcount_cont_shift) }
  bench.report("to_s")       { numbers.map(&.popcount_to_s)       }
end
```


### Let’s compare Ruby (+ help) to Crystal

```nohighlight
$ ruby popcount.rb
Comparison:
             builtin:    22184.1 i/s
          bit_elim_c:    14339.1 i/s - 1.55x slower
              cached:     4612.9 i/s - 4.81x slower
          prog_shift:     2631.8 i/s - 8.43x slower
                to_s:      815.9 i/s - 27.19x slower
            bit_elim:      752.7 i/s - 29.47x slower
          cont_shift:      347.1 i/s - 63.90x slower
```

```nohighlight

$ crystal compile --release popcount.cr
$ ./popcount
  popcount 345.28k (± 3.31%)       fastest
prog_shift 306.29k (± 2.94%)  1.13× slower
    cached 207.46k (± 2.94%)  1.66× slower
  bit_elim  56.94k (± 1.77%)  6.06× slower
cont_shift  56.79k (± 1.14%)  6.08× slower
      to_s    3.5k (± 0.87%) 98.54× slower
```
<!-- .element: class="fragment" -->
