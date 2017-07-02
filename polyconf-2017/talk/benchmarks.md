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
class CreateWhatevers < ActiveRecord::Migration[5.1]
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
      exception miss   441.174k i/100ms
       exception hit   114.559k i/100ms
              SELECT   522.000  i/100ms
              INSERT    21.000  i/100ms
Calculating -------------------------------------
      exception miss     14.669M (± 2.7%) i/s -     73.676M in   5.027647s
       exception hit      1.435M (± 1.6%) i/s -      7.217M in   5.031332s
              SELECT      4.855k (± 3.8%) i/s -     24.534k in   5.060903s
              INSERT    224.948  (± 9.8%) i/s -      1.134k in   5.084542s

Comparison:
      exception miss: 14668954.7 i/s
       exception hit:  1434854.2 i/s - 10.22x  slower
              SELECT:     4855.2 i/s - 3021.30x  slower
              INSERT:      224.9 i/s - 65210.36x  slower
```


# 1. always benchmark
# 2. adjust algorithm
<!-- .element: class="fragment" -->
# 3. implementations?
<!-- .element: class="fragment" -->
### <span class="fragment">(but if you did</span><br /><span class="fragment">and it’s _still_ too slow</span><br /><span class="fragment">it might be worthwhile<br />to look into other languages…)</span>


[![microseconds](img/microseconds.png)](https://twitter.com/rob_pike/status/878412416127606784)


[![1mmreqs](img/1mmreqs.png)](https://twitter.com/elorest/status/873785627170308096)


[![pivotal](img/pivotal.png)](https://twitter.com/jamie_gaskins/status/722431992218984449)
