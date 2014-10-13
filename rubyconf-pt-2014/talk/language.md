# Ruby the language

* Ruby core is full of goodies
<!-- .element: class="fragment" -->

* Ruby standard library<br />is little known (WeakRef!)
<!-- .element: class="fragment" -->

<p class='fragment quote'>
  Two easy steps to quickly<br />
  get better at programming Ruby:<br />
  1) read about enumerable.rb<br />
  2) read it again.<br />
  — Florian Gilcher
</p>



```ruby
require 'prime'
prime, composite = (1..10).partition(&:prime?)
p prime
p composite
```

```no-highlight
[2, 3, 5, 7]
[1, 4, 6, 8, 9, 10]
```
<!-- .element: class="fragment" -->

```ruby
require 'prime'
p (1..Float::INFINITY).lazy.select(&:prime?).take(10).to_a
```
<!-- .element: class="fragment" -->

```no-highlight
[2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
```
<!-- .element: class="fragment" -->

```ruby
require 'prime'
(1..10).slice_before(&:prime?).each { |a| p a }
```
<!-- .element: class="fragment" -->

```no-highlight
[1]
[2]
[3, 4]
[5, 6]
[7, 8, 9, 10]
```
<!-- .element: class="fragment" -->

## read [`Enumerable#slice_before` docs](http://rubydoc.info/stdlib/core/Enumerable#slice_before-instance_method) after this talk<br />for a good overview of Ruby object interop
<!-- .element: class="fragment" -->


# `Enumerable#chunk`

```ruby
require 'prime'
(1..10).chunk(&:prime?).each { |a, b| p [a, b] }
```
<!-- .element: class="fragment" -->

```no-highlight
[false, [1]]
[true, [2, 3]]
[false, [4]]
[true, [5]]
[false, [6]]
[true, [7]]
[false, [8, 9, 10]]
```
<!-- .element: class="fragment" -->

## read [`Enumerable#chunk` docs](http://rubydoc.info/stdlib/core/Enumerable#chunk-instance_method) for some<br />good old magic value trolling
<!-- .element: class="fragment" -->


```ruby
%(foo bar baz).grep(/a/)   #=> ['bar', 'baz']
```

```ruby
(1..10).grep(5)   #=> [5]
```
<!-- .element: class="fragment" -->

```ruby
(1..10).grep(3..7)   #=> [3, 4, 5, 6, 7]
```
<!-- .element: class="fragment" -->

## (how is this even implemented?<br />we’ll see a bit later)
<!-- .element: class="fragment" -->

```ruby
require 'date'
year = Date.new(2014)..(Date.new(2015) - 1)
#=> #<Date: 2014-01-01 …>..#<Date: 2014-12-31 …>
rand(year)
#=> #<Date: 2014-04-30 ((2456778j,0s,0n),+0s,2299161j)>
year.to_a.sample
#=> #<Date: 2014-12-29 ((2457021j,0s,0n),+0s,2299161j)>
year.to_a.sample
#=> #<Date: 2014-10-03 ((2456934j,0s,0n),+0s,2299161j)>
year.to_a.sample(random: Random.new(761))
#=> #<Date: 2014-10-13 ((2456944j,0s,0n),+0s,2299161j)>
year.to_a.sample(random: Random.new(761))
#=> #<Date: 2014-10-13 ((2456944j,0s,0n),+0s,2299161j)>
```
<!-- .element: class="fragment" -->


## you have an array of table names and<br />a method of getting per-table results

```ruby
tables = %i(accounts contacts notes)

def results_for(table)
  "results for #{table}"
end
```
<!-- .element: class="fragment" -->

## how to best combine them into<br />a table-name-keyed hash?
<!-- .element: class="fragment" -->

```ruby
tables.reduce({}) { |hash, table| hash[table] = results_for(table); hash }
#=> { accounts: 'results for accounts', contacts: 'results for contacts', … }
```
<!-- .element: class="fragment" -->

```ruby
tables.each.with_object({}) { |table, hash| hash[table] = results_for(table) }
```
<!-- .element: class="fragment" -->

```ruby
results = tables.map { |table| results_for(table) }
Hash[tables.zip(results)]
```
<!-- .element: class="fragment" -->

```ruby
tables.map { |table| [table, results_for(table)] }.to_h
```
<!-- .element: class="fragment" -->

## last one [from Sam Ruby](https://gist.github.com/chastell/1900f257310e5212f3c2)
<!-- .element: class="fragment" -->



# exception tagging

## you wouldn’t believe, but there are times<br />when third-party APIs leak<br />tonnes of different exception classes
<!-- .element: class="fragment" -->

```ruby
APIException = Module.new

class APIWrapper
  def make_an_api_call
    # make the actual call here
  rescue => exception
    exception.extend APIException
    raise
  end
end
```
<!-- .element: class="fragment" -->

```ruby
class DomainObject
  def some_domain_stuff
    APIWrapper.new.make_an_api_call
  rescue APIException
    # handle *all* exceptions from that API here
  end
end
```
<!-- .element: class="fragment" -->

## via Avdi Grimm’s [_Exceptional Ruby_](http://exceptionalruby.com)
<!-- .element: class="fragment" -->


# default parametes

```ruby
def add(a, b = (return 42; nil))
  a + b
end
```
<!-- .element: class="fragment" -->

```ruby
add(1, 2)   #=> 3
add(1)      #=> 42
```
<!-- .element: class="fragment" -->

```ruby
def div(text = yield)
  "<div>#{text}</div>"
end
```
<!-- .element: class="fragment" -->

```ruby
div('foo')      #=> '<div>foo</div>'
div { 'bar' }   #=> '<div>bar</div>'
```
<!-- .element: class="fragment" -->

## via Avdi Grimm
<!-- .element: class="fragment" -->


# new Ruby 2.1 syntax

```ruby
1/3r   #=> (1/3)
1.3r   #=> (13/10)

2+3i   #=> (2+3i)
2.3.i  #=> (0+2.3i)

'foo'.b   #=> a string with binary (ASCII-8BIT) encoding
```
<!-- .element: class="fragment" -->

## `String#freeze` compiler optimisations<br />`'bar'.freeze` returns a single<br />shared frozen instance
<!-- .element: class="fragment" -->
