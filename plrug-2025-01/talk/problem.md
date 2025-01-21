### [Daily Coding Problem](https://www.dailycodingproblem.com/) #1100

![](img/daily_coding_problem.png) <!-- .element class="fragment" style="width: 75%" -->


### let’s TDD

```ruby
require 'minitest/autorun'
```
<!-- .element class="fragment" -->
```ruby
require 'minitest/pride'
```
<!-- .element class="fragment" -->
```ruby
describe '#found?' do
  it 'is a predicate wheter the list includes the number' do
    list = [2, 3, 5, 7, 9, 100]
    assert list.all? { |number| found?(list:, number:) }
  end
end
```
<!-- .element class="fragment" -->
```ruby
def found?(list:, number:) = true
```
<!-- .element class="fragment" -->
<br />

```text
Run options: --seed 38267

# Running:

.

Fabulous run in 0.001278s, 782.1801 runs/s, 782.1801 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
```
<!-- .element class="fragment" -->


```ruby
require 'minitest/autorun'
require 'minitest/pride'

describe '#found?' do
  it 'is a predicate wheter the list includes the number' do
    list = [2, 3, 5, 7, 9, 100]
    assert list.all? { |number| found?(list:, number:) }
```
```ruby
    excl = (0..101).to_a - list
    assert excl.none? { |number| found?(list:, number:) }
```
<!-- .element class="fragment" -->
```ruby
  end
end
```
```ruby
def found?(list:, number:) = list.include?(number)
```
<!-- .element class="fragment" -->
<br />

```text
Run options: --seed 37462

# Running:

.

Fabulous run in 0.001399s, 714.6778 runs/s, 1429.3555 assertions/s.

1 runs, 2 assertions, 0 failures, 0 errors, 0 skips
```
<!-- .element class="fragment" -->


### Daily Coding Problem #1100

* <span class="fragment">determine if an element is in the list<br />without performing any multiplication,<br />division, or bit-shift operations</span> <span class="fragment">✅</span>
* <span class="fragment">do this in `O(log N)` time</span> <span class="fragment">🤔</span>


```ruby
require 'minitest/autorun'
require 'minitest/pride'

describe '#found?' do
  it 'is a predicate wheter the list includes the number' do
    list = [2, 3, 5, 7, 9, 100]
    assert list.all? { |number| found?(list:, number:) }
    excl = (0..101).to_a - list
    assert excl.none? { |number| found?(list:, number:) }
  end
```
```ruby
  it 'works with large numbers' do
    list = [1, 2, 1_000_000]
    assert list.all? { |number| found?(list:, number:) }
    refute found?(list:, number: 999_999)
  end
```
<!-- .element class="fragment" -->
```ruby
  it 'works with large lists' do
    list = (1..1_000_000).to_a
    assert found?(list:, number: 999_999)
  end
```
<!-- .element class="fragment" -->
```ruby
end

def found?(list:, number:) = list.include?(number)
```


```text
Run options: --seed 33427

# Running:

...

Fabulous run in 0.032667s, 91.8359 runs/s, 153.0599 assertions/s.

3 runs, 5 assertions, 0 failures, 0 errors, 0 skips
```


```ruby
require 'minitest/autorun'
require 'minitest/benchmark'
require 'minitest/pride'

describe 'FinderBenchmark' do
```
```ruby
  bench_range { bench_exp(1, 10_000) } #=> [1, 10, 100, 1000, 10000]
```
<!-- .element class="fragment" -->
```ruby
  Scenario = Data.define(:list, :number) { alias_method :to_hash, :to_h }
```
<!-- .element class="fragment" -->
```ruby
  def setup
    @scenarios = self.class.bench_range.map do |bench|
      { bench => Scenario.new(list: (1..bench).to_a, number: bench / 2 ) }
    end.reduce(:merge)
  end
```
<!-- .element class="fragment" -->
```ruby
  bench_performance_logarithmic 'logarithmic' do |bench|
    scenario = @scenarios.fetch(bench)
    100_000.times { found?(**scenario) }
  end
```
<!-- .element class="fragment" -->
```ruby
end

def found?(list:, number:) = list.include?(number)
```


```text
Run options: --seed 51684

# Running:

...bench_logarithmic     0.042946        0.034617        0.058196
                         0.287026        2.559533
F

Fabulous run in 3.027118s, 1.3214 runs/s, 1.9821 assertions/s.

  1) Failure:
FinderBenchmark#bench_logarithmic […]:
Expected 0.5747040238293363 to be >= 0.99.

4 runs, 6 assertions, 1 failures, 0 errors, 0 skips
```


```ruby
def found?(list:, number:)
```
```ruby
  return false if list.empty?
  return false if number < list.first
  return false if number > list.last
  return true  if number == list.first
  return true  if number == list.last
```
<!-- .element class="fragment" -->
```ruby
  index = 1
  index += index while index + index < list.size

  case number <=> list[index]
  when -1 then found?(list: list[...index], number:)
  when  0 then true
  when  1 then found?(list: list[index..], number:)
  end
end
```


```ruby
require 'minitest/autorun'
require 'minitest/benchmark'
require 'minitest/pride'

describe 'FinderBenchmark' do
  bench_range { bench_exp(1, 1_000_000) }
  #=> [1, 10, 100, 1_000, 10_000, 100_000, 1_000_000]

  Scenario = Data.define(:list, :number) { alias_method :to_hash, :to_h }

  def setup
    @scenarios = self.class.bench_range.map do |bench|
      { bench => Scenario.new(list: (1..bench).to_a, number: bench / 2 ) }
    end.reduce(:merge)
  end

  bench_performance_logarithmic 'logarithmic' do |bench|
    scenario = @scenarios.fetch(bench)
    100_000.times { found?(**scenario) }
  end
end
```


```text
Run options: --seed 6442

# Running:

bench_logarithmic        0.032838        0.088122        0.286078
                         0.428899        0.587109        0.767243
                         0.927884
....

Fabulous run in 3.198829s, 1.2505 runs/s, 1.8757 assertions/s.

4 runs, 6 assertions, 0 failures, 0 errors, 0 skips
```
