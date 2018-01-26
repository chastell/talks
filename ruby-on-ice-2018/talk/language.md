# Ruby the language

* Ruby core is full of goodies
<!-- .element: class="fragment" -->

* Ruby standard library<br />is little known (WeakRef!)
<!-- .element: class="fragment" -->

[![enumerable](img/enumerable.png)](https://twitter.com/Argorak/status/76390303401132032)
<!-- .element: class="fragment" -->


```ruby
require 'prime'
prime, composite = (1..10).partition(&:prime?)
```

```ruby
prime       #=> [2, 3, 5, 7]
composite   #=> [1, 4, 6, 8, 9, 10]
```
<!-- .element: class="fragment" -->

```ruby
require 'prime'
(1..Float::INFINITY).select(&:prime?).first(10)
```
<!-- .element: class="fragment" -->

[![JIRA](img/jira.png)](https://twitter.com/Argorak/status/458905318312128512)
<!-- .element: class="fragment" -->

```ruby
require 'prime'
(1..Float::INFINITY).lazy.select(&:prime?).take(10).to_a
```
<!-- .element: class="fragment" -->

```ruby
#=> [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
```
<!-- .element: class="fragment" -->


```ruby
require 'prime'
(1..10).chunk(&:prime?).each { |predicate, elems| p [predicate, elems] }
```

```shell
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
%w(foo bar baz).grep('bar')   #=> ['bar']
```

```ruby
%w(foo bar baz).grep(/a/)   #=> ['bar', 'baz']
```
<!-- .element: class="fragment" -->

```ruby
(1..10).grep(5)             #=> [5]
```
<!-- .element: class="fragment" -->

```ruby
(1..10).grep(3..7)          #=> [3, 4, 5, 6, 7]
```
<!-- .element: class="fragment" -->

## (how is this even implemented?)
<!-- .element: class="fragment" -->


<a href="https://twitter.com/Argorak/status/314745351292715008"><img src="img/randomisation.png" style="width: 60%" /></a>

```ruby
require 'date'
year = Date.new(2018)..(Date.new(2019) - 1)
#=> #<Date: 2018-01-01 …>..#<Date: 2018-12-31 …>
```
<!-- .element: class="fragment" -->

```ruby
rand(year)                               #=> #<Date: 2018-10-04 …>
```
<!-- .element: class="fragment" -->

```ruby
year.to_a.sample                         #=> #<Date: 2018-07-29 …>
year.to_a.sample                         #=> #<Date: 2018-04-03 …>
```
<!-- .element: class="fragment" -->

```ruby
year.to_a.sample(random: Random.new(51)) #=> #<Date: 2018-02-27 …>
year.to_a.sample(random: Random.new(51)) #=> #<Date: 2018-02-27 …>
```
<!-- .element: class="fragment" -->

```ruby
Random.new(51).rand(year)                #=> #<Date: 2018-02-27 …>
```
<!-- .element: class="fragment" -->


## an array of tables + a way of getting per-table results

```ruby
tables = %i[accounts contacts notes]

def results_for(table)
  "results for #{table}"
end
```
<!-- .element: class="fragment" -->

## how to combine them into a table-keyed hash?
<!-- .element: class="fragment" -->

```ruby
#=> { accounts: 'results for accounts', contacts: 'results for contacts', … }
```
<!-- .element: class="fragment" -->

```ruby
tables.reduce({}) { |hash, table| hash[table] = results_for(table); hash }
```
<!-- .element: class="fragment" -->

```ruby
tables.each.with_object({}) { |table, hash| hash[table] = results_for(table) }
```
<!-- .element: class="fragment" -->

```ruby
Hash[tables.zip(tables.map(&method(:results_for)))]
```
<!-- .element: class="fragment" -->

```ruby
tables.map { |table| [table, results_for(table)] }.to_h   # via Sam Ruby
```
<!-- .element: class="fragment" -->

```ruby
tables.map { |table| { table => results_for(table) } }.reduce(:merge)
```
<!-- .element: class="fragment" -->



# exception tagging

## there are times when third-party APIs<br />leak tonnes of different exception classes
<!-- .element: class="fragment" -->

```ruby
FooAPIException = Module.new

class FooAPIWrapper
  def make_a_foo_api_call
    # make the actual call here
  rescue => exception
    exception.extend FooAPIException
    raise
  end
end
```
<!-- .element: class="fragment" -->

```ruby
class DomainObject
  def some_domain_stuff
    FooAPIWrapper.new.make_an_api_call
  rescue FooAPIException
    # handle *all* exceptions from Foo API here
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


# Ruby literal postfix syntax

```ruby
0.1 + 0.2
```

```ruby
#=> 0.30000000000000004
```
<!-- .element: class="fragment" -->

## visit <code>[0.30000000000000004.com](http://0.30000000000000004.com/)</code>
<!-- .element: class="fragment" -->

```ruby
1/3r        #=> (1/3)
1.3r        #=> (13/10)
0.1r + 0.2r #=> (3/10)
```
<!-- .element: class="fragment" -->

```ruby
2+3i        #=> (2+3i)
2.3.i       #=> (0+2.3i)
```
<!-- .element: class="fragment" -->

```ruby
1+2.3ri     #=> (1+(23/10)*i)
```
<!-- .element: class="fragment" -->

```ruby
'foo'.b        #=> a string with binary (ASCII-8BIT) encoding
'bar'.freeze   #=> compiler optimisation: a single frozen instance
```
<!-- .element: class="fragment" -->

## Ruby 2.3: magic comment<br />`# frozen_string_literal: true`
<!-- .element: class="fragment" -->

## Ruby 3.0: default
<!-- .element: class="fragment" -->
