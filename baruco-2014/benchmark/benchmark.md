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
#  6.370000   0.010000   6.380000 (  6.377305)
```

!SLIDE

```ruby
require 'benchmark'
require 'prime'

puts Benchmark.measure { 2646216567629137.simple_prime? }
#  6.370000   0.010000   6.380000 (  6.377305)

puts Benchmark.measure { 2646216567629137.clever_prime? }
#  3.200000   0.000000   3.200000 (  3.200854)
```

!SLIDE

```ruby
require 'benchmark'
require 'prime'

puts Benchmark.measure { 2646216567629137.simple_prime? }
#  6.370000   0.010000   6.380000 (  6.377305)

puts Benchmark.measure { 2646216567629137.clever_prime? }
#  3.200000   0.000000   3.200000 (  3.200854)

puts Benchmark.measure { 2646216567629137.prime? }
# 10.270000   0.010000  10.280000 ( 10.275215)
```

!SLIDE

```ruby
require 'benchmark'
require 'prime'

puts Benchmark.measure { 2646216567629137.simple_prime? }
#  6.370000   0.010000   6.380000 (  6.377305)

puts Benchmark.measure { 2646216567629137.clever_prime? }
#  3.200000   0.000000   3.200000 (  3.200854)

puts Benchmark.measure { 2646216567629137.prime? }
# 10.270000   0.010000  10.280000 ( 10.275215)

puts RUBY_VERSION
# 2.1.2
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
# simple:   6.700000   0.010000   6.710000 (  6.696968)
# clever:   3.200000   0.000000   3.200000 (  3.209215)
# stdlib:  10.160000   0.010000  10.170000 ( 10.161679)
# --------------------------------- total: 20.080000sec
#
#               user     system      total        real
# simple:   6.390000   0.000000   6.390000 (  6.386522)
# clever:   3.270000   0.000000   3.270000 (  3.270265)
# stdlib:  10.170000   0.010000  10.180000 ( 10.182963)
```

!SLIDE

```ruby
Benchmark.bmbm do |bench|
  bench.report('simple:') { 2646216567629137.simple_prime? }
  bench.report('clever:') { 2646216567629137.clever_prime? }
  bench.report('stdlib:') { 2646216567629137.prime?        }
end

# Rehearsal -------------------------------------------
# simple:   6.700000   0.010000   6.710000 (  6.696968)
# clever:   3.200000   0.000000   3.200000 (  3.209215)
# stdlib:  10.160000   0.010000  10.170000 ( 10.161679)
# --------------------------------- total: 20.080000sec
#
#               user     system      total        real
# simple:   6.390000   0.000000   6.390000 (  6.386522)
# clever:   3.270000   0.000000   3.270000 (  3.270265)
# stdlib:  10.170000   0.010000  10.180000 ( 10.182963)
```

* your task: try to figure out why
