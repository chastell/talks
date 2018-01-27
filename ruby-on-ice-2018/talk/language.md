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
require 'date'

class Date
  def free?
    saturday? or sunday?
  end
end

ruby_on_ice  = Date.new(2018, 1, 26)
isle_of_ruby = Date.new(2018, 4, 13)
```

```ruby
fun   = %w[⚓ ⚛ ♥ ♫ ⚘ ✍ ✂ ⚔]
plans = ->(free) { free ? fun.sample : '⚒' }
```
<!-- .element: class="fragment" -->

```ruby
(ruby_on_ice..isle_of_ruby).chunk(&:free?).each do |free, dates|
  puts dates.map { plans.(free) }.join ' '
end
```
<!-- .element: class="fragment" -->

```shell
⚒
⚛ ✂
⚒ ⚒ ⚒ ⚒ ⚒
⚔ ✍
⚒ ⚒ ⚒ ⚒ ⚒
⚓ ♫
⚒ ⚒ ⚒ ⚒ ⚒
♥ ⚔
…
```
<!-- .element: class="fragment" -->

## read [`Enumerable#chunk` docs](http://rubydoc.info/stdlib/core/Enumerable#chunk-instance_method) for some<br />good old magic value trolling
<!-- .element: class="fragment" -->


```ruby
%w[foo bar baz].grep('bar')   #=> ['bar']
```

```ruby
%w[foo bar baz].grep(/a/)     #=> ['bar', 'baz']
```
<!-- .element: class="fragment" -->

```ruby
%w[foo bar baz].grep_v(/a/)   #=> ['foo']
```
<!-- .element: class="fragment" -->

```ruby
(1..10).grep(5)               #=> [5]
```
<!-- .element: class="fragment" -->

```ruby
(1..10).grep(3..7)            #=> [3, 4, 5, 6, 7]
```
<!-- .element: class="fragment" -->

```ruby
(1..10).grep_v(3..7)          #=> [1, 2, 8, 9, 10]
```
<!-- .element: class="fragment" -->

```ruby
[1, 2.3, -4].grep(Integer)    #=> [1, -4]
```
<!-- .element: class="fragment" -->

```ruby
[1, 2.3, -4].all?(Numeric)    #=> true
```
<!-- .element: class="fragment" -->

```ruby
[1, 2.3, -4].all?(Integer)    #=> false
```
<!-- .element: class="fragment" -->

```ruby
[1, 2.3, -4].any?(Float)      #=> true
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
```
<!-- .element: class="fragment" -->

```ruby
1+2.3ri     #=> (1+(23/10)*i)
```
<!-- .element: class="fragment" -->


# copy constructor

```ruby
class Foo
  def initialize(name)
    p __method__
    @name = name
  end

  def initialize_copy(other)
    p __method__
    p other
    super
  end
end

a = Foo.new('a')
b = a
c = a.dup
```
<!-- .element: class="fragment" -->

```shell
:initialize
:initialize_copy
#<Foo:0x007f2f3673efd0 @name="a">
```
<!-- .element: class="fragment" -->

## and here I was implementing `Foo#dup`<br />as `Marshal.load(Marshal.dump(self))`
<!-- .element: class="fragment" -->

## #TEAMNOIDEA
<!-- .element: class="fragment" -->


# WeakRef

* ephemeral objects<br />that might not be there later
<!-- .element: class="fragment" -->

* CRuby 2.0+: based on `ObjectSpace::WeakMap` in C
<!-- .element: class="fragment" -->

* CRuby 1.3-1.9: ~pure Ruby (how is it even possible?)
<!-- .element: class="fragment" -->

* [Mustermann!](https://github.com/rkh/mustermann)
<!-- .element: class="fragment" -->

[![memory](img/memory.png)](https://twitter.com/Argorak/status/826393995412635648)
<!-- .element: class="fragment" -->


# so very `Tempfile`

```ruby
require 'tempfile'
require 'weakref'

temp = WeakRef.new(Tempfile.new(''))
path = temp.path

puts "temp alive? → #{!!temp.weakref_alive?}"
puts "#{path} exists? → #{File.exist?(path)}"

2.times { GC.start }

puts "temp alive? → #{!!temp.weakref_alive?}"
puts "#{path} exists? → #{File.exist?(path)}"
```
<!-- .element: class="fragment" -->

```shell
temp alive? → true
/tmp/20141012-11183-etjwza exists? → true
temp alive? → false
/tmp/20141012-11183-etjwza exists? → false
```
<!-- .element: class="fragment" -->

# how does `Tempfile`<br />show itself out?
<!-- .element: class="fragment" -->


# now I am become `def`<br />the destroyer of codes

```ruby
class Foo
  def self.finalize(object_id)
    puts "finalizing #{object_id}"
  end

  def initialize
    puts "initializing #{object_id}"
    ObjectSpace.define_finalizer self, self.class.method(:finalize)
  end
end

require 'weakref'
WeakRef.new(Foo.new)
puts 'before GC'
GC.start
puts 'after GC'
Foo.new
```
<!-- .element: class="fragment" -->

```shell
initializing 70216017649280
before GC
finalizing 70216017649280
after GC
initializing 70216015331020
finalizing 70216015331020
```
<!-- .element: class="fragment" -->


# now I am become `def`<br />the destroyer of codes

```ruby
class Foo
  def initialize
    puts "initializing #{object_id}"
    ObjectSpace.define_finalizer self, -> (id) { puts "finalizing #{id}" }
  end
end

require 'weakref'

WeakRef.new(Foo.new)
puts 'before GC'
GC.start
puts 'after GC'
Foo.new
```
<!-- .element: class="fragment" -->

```shell
initializing 70060097535620
before GC
after GC
initializing 70060095217580
finalizing 70060095217580
finalizing 70060097535620
```
<!-- .element: class="fragment" -->

## hey, why did the first one live so long?
<!-- .element: class="fragment" -->


# inter-language tooling

* `GC.stop` + do-some-work + `GC.start` allow<br />out-of-band GC runs (see Unicorn)
<!-- .element: class="fragment" -->

* `ObjectSpace.count_objects` to get allocation stats
<!-- .element: class="fragment" -->

* `ObjectSpace.each_object`<br />to iterate over all the objects
<!-- .element: class="fragment" -->

* `ObjectSpace.define_finalizer`<br />for per-object destructors
<!-- .element: class="fragment" -->

* watch Aaron Patterson’s talks
<!-- .element: class="fragment" -->
