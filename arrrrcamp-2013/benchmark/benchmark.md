!SLIDE

```ruby
require 'benchmark'
require 'prime'
```

!SLIDE

```ruby
require 'benchmark'
require 'prime'

puts Benchmark.measure { 2646216567629137.simple_prime? }
#  6.790000   0.000000   6.790000 (  6.798976)
```

!SLIDE

```ruby
require 'benchmark'
require 'prime'

puts Benchmark.measure { 2646216567629137.simple_prime? }
#  6.790000   0.000000   6.790000 (  6.798976)

puts Benchmark.measure { 2646216567629137.clever_prime? }
#  3.420000   0.000000   3.420000 (  3.426723)
```

!SLIDE

```ruby
require 'benchmark'
require 'prime'

puts Benchmark.measure { 2646216567629137.simple_prime? }
#  6.790000   0.000000   6.790000 (  6.798976)

puts Benchmark.measure { 2646216567629137.clever_prime? }
#  3.420000   0.000000   3.420000 (  3.426723)

puts Benchmark.measure { 2646216567629137.prime? }
# 12.680000   0.000000  12.680000 ( 12.695168)
```

!SLIDE

```ruby
Benchmark.bmbm do |bench|



end
```

!SLIDE

```ruby
Benchmark.bmbm do |bench|
  bench.report('simple:') { 2646216567629137.simple_prime? }
  bench.report('clever:') { 2646216567629137.clever_prime? }
  bench.report('stdlib:') { 2646216567629137.prime?        }
end
```

!SLIDE

```ruby
Benchmark.bmbm do |bench|
  bench.report('simple:') { 2646216567629137.simple_prime? }
  bench.report('clever:') { 2646216567629137.clever_prime? }
  bench.report('stdlib:') { 2646216567629137.prime?        }
end

# Rehearsal -------------------------------------------
# simple:   6.980000   0.000000   6.980000 (  6.994226)
# clever:   3.460000   0.000000   3.460000 (  3.465885)
# stdlib:  12.610000   0.010000  12.620000 ( 12.634325)
# --------------------------------- total: 23.060000sec
#
#               user     system      total        real
# simple:   6.860000   0.000000   6.860000 (  6.872590)
# clever:   3.400000   0.000000   3.400000 (  3.407474)
# stdlib:  12.710000   0.000000  12.710000 ( 12.724847)
```

!SLIDE

```ruby
Benchmark.bmbm do |bench|
  bench.report('simple:') { 2646216567629137.simple_prime? }
  bench.report('clever:') { 2646216567629137.clever_prime? }
  bench.report('stdlib:') { 2646216567629137.prime?        }
end

# Rehearsal -------------------------------------------
# simple:   6.980000   0.000000   6.980000 (  6.994226)
# clever:   3.460000   0.000000   3.460000 (  3.465885)
# stdlib:  12.610000   0.010000  12.620000 ( 12.634325)
# --------------------------------- total: 23.060000sec
#
#               user     system      total        real
# simple:   6.860000   0.000000   6.860000 (  6.872590)
# clever:   3.400000   0.000000   3.400000 (  3.407474)
# stdlib:  12.710000   0.000000  12.710000 ( 12.724847)
```

* your task: try to figure out why
