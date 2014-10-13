# protocols

* the basis of Ruby<br />object interoperability
<!-- .element: class="fragment" -->

* cornerstone of Ruby’s<br />duck typing
<!-- .element: class="fragment" -->

* it might be worthwhile to<br />make your objects conformant
<!-- .element: class="fragment" -->


# type conversion

## explicit: `to_x`<br />`to_i`, `to_s`, `to_a`…<br />most liberal:<br />`' 12 Monkeys '.to_i #=> 12`
<!-- .element: class="fragment" -->

## implicit: `to_xxx`<br />`to_int`, `to_str`, `to_ary`…<br />for ~equivalent, used internally
<!-- .element: class="fragment" -->

## `Kernel.Method`<br />`Integer`, `String`, `Array`…<br />to validate / enforce input
<!-- .element: class="fragment" -->

## read Avdi Grimm’s [_Confident Ruby_](http://www.confidentruby.com)
<!-- .element: class="fragment" -->


# fun with bins: `#[]`

```ruby
35.to_s(2)         #=> '100011'
'100011'.to_i(2)   #=> 35
35[1]              #=> 1
35[2]              #=> 0
```
<!-- .element: class="fragment" -->

## can we encode a set of integers in an int?
<!-- .element: class="fragment" -->

```ruby
module B
  module_function

  def [](*bits)
    bits.reduce(0) { |int, bit| int | 1 << bit }
  end
end

B[1,2]     #=> 6  (110 in binary)
B[0,1,5]   #=> 35 (100011 in binary)

B[1,2][2]     #=> 1 (2 is a member of B[1,2])
B[0,1,5][2]   #=> 0 (2 is not a member of B[0,1,5])
```
<!-- .element: class="fragment" -->

## set of sets of ints: `Set` of `Integers`
<!-- .element: class="fragment" -->


# `#equal?`, `#==`, `#eql?` and `#hash`

* `#equal?` is for identity
<!-- .element: class="fragment" -->

* `#==` is for value equality
<!-- .element: class="fragment" -->

* `#eql?` is for `Hash` key equality
<!-- .element: class="fragment" -->

* `#hash` is for cheap checks<br />before expensive `#eql?`
<!-- .element: class="fragment" -->

* two `#hash` calls differ: non-`eql?`
<!-- .element: class="fragment" -->

* two `#hash` calls equal: check `#eql?`
<!-- .element: class="fragment" -->

* now `Bignum#hash` on Ruby 1.8.6…
<!-- .element: class="fragment" -->



# don’t shy from using `Range`

```ruby
require 'date'

Conf = Struct.new(:name, :dates)

confs = [
  Conf.new('BaRuCo',      Date.new(2014,  9, 12)..Date.new(2014,  9, 13)),
  Conf.new('ArrrrCamp',   Date.new(2014, 10,  2)..Date.new(2014, 10,  3)),
  Conf.new('RubyConf PT', Date.new(2014, 10, 13)..Date.new(2014, 10, 14)),
]
```

```ruby
class ConfList
  include Enumerable

  def initialize(confs)
    @confs = confs
  end

  def each_conf
    return to_enum(__method__) unless block_given?   # THIS IS SUPER FUN
    @confs.each { |conf| yield conf }
  end

  alias_method :each, :each_conf
end
```
<!-- .element: class="fragment" -->


# `#each` – all the Enumerables

```ruby
conf_list = ConfList.new(confs)
conf_list.each_conf { |conf| puts conf.name }
```

```no-highlight
BaRuCo
ArrrrCamp
RubyConf PT
```
<!-- .element: class="fragment" -->

```ruby
class Conf
  def to_s
    "#{dates.begin} to #{dates.end}: #{name}"
  end
end
```
<!-- .element: class="fragment" -->

```ruby
conf_list.each &method(:puts)
```
<!-- .element: class="fragment" -->

```no-highlight
2014-09-12 to 2014-09-13: BaRuCo
2014-10-02 to 2014-10-03: ArrrrCamp
2014-10-13 to 2014-10-14: RubyConf PT
```
<!-- .element: class="fragment" -->

```ruby
class Conf
  def finished?
    dates.end < Date.today
  end
end
```
<!-- .element: class="fragment" -->

```ruby
done, not_done = conf_list.partition(&:finished?)
puts "done: #{done.map(&:name).join(', ')}"
puts "not:  #{not_done.map(&:name).join(', ')}"
```
<!-- .element: class="fragment" -->

```no-highlight
done: BaRuCo, ArrrrCamp
not:  RubyConf PT
```
<!-- .element: class="fragment" -->


# `#<=>` – all the Comparables

```ruby
require 'date'

Conf = Struct.new(:name, :dates) do
  def <=>(other)
    case
    when dates.begin < other.dates.begin then -1
    when dates.begin > other.dates.begin then  1
    when dates.end < other.dates.end     then -1
    when dates.end > other.dates.end     then  1
    else 0
    end
  end

  def to_s
    "#{dates.begin} to #{dates.end}: #{name}"
  end
end

confs = [
  Conf.new('RubyConf PT', Date.new(2014, 10, 13)..Date.new(2014, 10, 14)),
  Conf.new('JRubyConf',   Date.new(2014,  8,  1)..Date.new(2014,  8,  1)),
  Conf.new('eurucamp',    Date.new(2014,  8,  1)..Date.new(2014,  8,  3)),
]

confs.sort.each &method(:puts)
```

```no-highlight
2014-08-01 to 2014-08-01: JRubyConf
2014-08-01 to 2014-08-03: eurucamp
2014-10-13 to 2014-10-14: RubyConf PT
```
<!-- .element: class="fragment" -->


# what if we compare<br />with a non-`Conf`?

```ruby
0 == 0    #=> true
0.zero?   #=> true
7.zero?   #=> false
```
<!-- .element: class="fragment" -->

```ruby
0.nonzero?   #=> nil
7.nonzero?   #=> 7
```
<!-- .element: class="fragment" -->

# why does `Numeric#nonzero?`<br />not return `true`/`false`?
<!-- .element: class="fragment" -->


## `#<=>` protocol says ‘`nil` means non-comparable’

```ruby
class Conf
  def <=>(other)
    return nil unless other.is_a?(self.class)
    (dates.begin <=> other.dates.begin).nonzero? or
      (dates.end <=> other.dates.end)
  end
end
```
<!-- .element: class="fragment" -->

## `Numeric#nonzero?` allows chaining `<=>` calls
<!-- .element: class="fragment" -->

```ruby
class Conf
  include Comparable
end

jrubyconf = Conf.new('JRubyConf', Date.new(2014, 8, 1)..Date.new(2014, 8, 1))
eurucamp  = Conf.new('eurucamp',  Date.new(2014, 8, 1)..Date.new(2014, 8, 3))
baruco    = Conf.new('BaRuCo',   Date.new(2014, 9, 12)..Date.new(2014, 9, 13))
jrubyconf < eurucamp                   #=> true
eurucamp.between?(jrubyconf, baruco)   #=> true
```
<!-- .element: class="fragment" -->

## `Comparable` provides `#<`, `#<=`, …, also `#between?`
<!-- .element: class="fragment" -->



# `#call`

## anything that responds to `#call`<br />can be replaced by a `Proc` or a `lambda`
<!-- .element: class="fragment" -->

## making your services respond to `#call`<br />means they can be doubled by<br />– and default to – any callable
<!-- .element: class="fragment" -->

## this is a naming trade-off:<br />a more fitting name is often better
<!-- .element: class="fragment" -->


# `Method#to_proc`

<p class='quote'>`class Object; alias_method :&, :method; end`<br />`closes = dates.map &asset&:close_price_on_date`<br />I will call it the pretzel bun.<br />— Gary Bernhardt</p>

```ruby
require 'date'

class Asset
  def close_price_on_date(date)
    "close price on #{date}"
  end
end

class Object
  alias_method :&, :method
end

dates = [Date.new(2014, 4, 30), Date.new(2014, 12, 29)]
asset = Asset.new

puts dates.map &asset&:close_price_on_date
```
<!-- .element: class="fragment" -->

```no-highlight
close price on 2014-04-30
close price on 2014-12-29
```
<!-- .element: class="fragment" -->


# my favourite protocol: `#===`

```ruby
require 'date'

def sorting_hat(input)
  case input
  when 'foo', 'bar', 'baz'    then 'so meta!'
  when /conf/i                then 'a conf!'
  when String                 then 'a string!'
  when 1995..Date.today.year  then 'Ruby alive!'
  when -> (n) { n.odd? }      then 'that’s odd…'
  else 'no clue!'
  end
end
```
<!-- .element: class="fragment" -->

```ruby
puts sorting_hat('bar')
puts sorting_hat('RubyConf PT')
puts sorting_hat('good clean fun')
puts sorting_hat(2009)
puts sorting_hat(Date.today.day)
puts sorting_hat(Date.today.month)
```
<!-- .element: class="fragment" -->

```no-highlight
so meta!
a conf!
a string!
Ruby alive!
that’s odd…
no clue!
```
<!-- .element: class="fragment" -->

## `Object#==`, `Regexp#match`, `Module#is_a?`,<br />`Range#between?`, `Proc#call`…
<!-- .element: class="fragment" -->


# protocols!

## using protocols means<br />proper object interoperability<br />‘X takes an object responding to `#to_path`’
<!-- .element: class="fragment" -->

## using protocols means<br />doubles can be common classes
<!-- .element: class="fragment" -->

## (like when your repo responds to `#fetch`<br />and can be doubled by a `Hash`)
<!-- .element: class="fragment" -->

## there are many protocols in Ruby<br />(like `IO`, or `mashal_dump` + `marshal_load`)
<!-- .element: class="fragment" -->

## do read up on `#coerce`
<!-- .element: class="fragment" -->
