# 🔥 benchmarks 🔥

<p class="quote"><span class="fragment">Synthetic benchmarks tell us sweet FA about real world performance of code,</span>
<span class="fragment" style="font-weight: bold">architecture</span>
<span class="fragment">being a much more significant consideration than the proportion of raw MIPS a given language will deliver on a given platform.</span></p>

<p class="quote"><span class="fragment">The average netbook could happily run all of Teller’s fusion bomb models</span>
<span class="fragment">along with the full telemetry analysis of all the Apollo missions</span>
<span class="fragment">in the pauses between loading XKCD comics</span>
<span class="fragment">and binning junk mail</span>
<span class="fragment">without the user being any the wiser.</span></p>

<p class="quote" style="text-align: right">— Eleanor McHugh</p>


```ruby
require 'active_record'
require 'benchmark/ips'

ActiveRecord::Base.establish_connection adapter: 'postgresql'
```

```ruby
class CreateWhatevers < ActiveRecord::Migration[5.2]
  def change
    create_table(:whatevers) { |table| table.text :text }
  end
end

CreateWhatevers.migrate :up
at_exit { CreateWhatevers.migrate :down }
```
<!-- .element: class="fragment" -->

```ruby
Whatever = Class.new(ActiveRecord::Base)

Benchmark.ips do |bench|
  bench.report('exception miss') { raise '💥' if false          }
  bench.report('exception hit')  { raise '💥' rescue nil        }
  bench.report('SELECT')         { Whatever.first               }
  bench.report('INSERT')         { Whatever.create(text: 'meh') }
  bench.compare!
end
```
<!-- .element: class="fragment" -->


```nohighlight
Warming up --------------------------------------
      exception miss   445.207k i/100ms
       exception hit   107.302k i/100ms
              SELECT   546.000  i/100ms
              INSERT    23.000  i/100ms
Calculating -------------------------------------
      exception miss     13.660M (± 3.6%) i/s -     68.562M in   5.026944s
       exception hit      1.375M (± 2.3%) i/s -      6.975M in   5.074398s
              SELECT      5.108k (± 4.5%) i/s -     25.662k in   5.034214s
              INSERT    241.202  (± 9.1%) i/s -      1.219k in   5.090564s

Comparison:
      exception miss: 13660293.4 i/s
       exception hit:  1375266.0 i/s - 9.93x  slower
              SELECT:     5108.2 i/s - 2674.19x  slower
              INSERT:      241.2 i/s - 56634.16x  slower

```


[![1mmreqs](img/1mmreqs.png)](https://twitter.com/elorest/status/873785627170308096)


[![opinions](img/opinions.png)](https://twitter.com/QuoteTwitts/status/881304526145429505)


# 1. always benchmark
# 2. adjust algorithm
<!-- .element: class="fragment" -->
# 3. implementations?
<!-- .element: class="fragment" -->
### <span class="fragment">(but if you did</span><br /><span class="fragment">and it’s _still_ too slow</span><br /><span class="fragment">it might be worthwhile<br />to look into other languages…)</span>


[![pivotal](img/pivotal.png)](https://twitter.com/jamie_gaskins/status/722431992218984449)
