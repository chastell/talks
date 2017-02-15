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

RUG = Struct.new(:name, :dates)

rugs = [
  RUG.new('Pivorak', Date.new(2017, 1, 20)..Date.new(2017, 1, 21)),
  RUG.new('RUG::B',  Date.new(2017, 2,  2)..Date.new(2017, 2,  3)),
  RUG.new('WRUG',    Date.new(2017, 2, 15)..Date.new(2017, 2, 16)),
]
```

```ruby
class RUGList
  include Enumerable

  def initialize(rugs)
    @rugs = rugs
  end

  def each_rug
    return to_enum(__method__) unless block_given?   # THIS IS SUPER FUN
    @rugs.each { |rug| yield rug }
  end

  alias_method :each, :each_rug
end
```
<!-- .element: class="fragment" -->


## `#each` – all the Enumerables

```ruby
rug_list = RUGList.new(rugs)
rug_list.each_rug { |rug| puts rug.name }
```

```no-highlight
Pivorak
RUG::B
WRUG
```
<!-- .element: class="fragment" -->

```ruby
class RUG
  def to_s
    "#{dates.begin} to #{dates.end}: #{name}"
  end
end
```
<!-- .element: class="fragment" -->

```ruby
rug_list.each &method(:puts)
```
<!-- .element: class="fragment" -->

```no-highlight
2017-01-20 to 2017-01-21: Pivorak
2017-02-02 to 2017-02-03: RUG::B
2017-02-15 to 2017-02-16: WRUG
```
<!-- .element: class="fragment" -->

```ruby
class RUG
  def finished?
    dates.end < Date.today
  end
end
```
<!-- .element: class="fragment" -->

```ruby
done, not_done = rug_list.partition(&:finished?)
puts "done: #{done.map(&:name).join(', ')}"
puts "not:  #{not_done.map(&:name).join(', ')}"
```
<!-- .element: class="fragment" -->

```no-highlight
done: Pivorak, RUG::B
not:  WRUG
```
<!-- .element: class="fragment" -->


# `#<=>` – all the Comparables

```ruby
require 'date'

RUG = Struct.new(:name, :dates) do
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

rugs = [
  RUG.new('Pivorak', Date.new(2017, 1, 20)..Date.new(2017, 1, 21)),
  RUG.new('RUG::B',  Date.new(2017, 2,  2)..Date.new(2017, 2,  3)),
  RUG.new('WRUG',    Date.new(2017, 2, 15)..Date.new(2017, 2, 16)),
]

rugs.sort.each &method(:puts)
```

```no-highlight
2017-01-20 to 2017-01-21: Pivorak
2017-02-02 to 2017-02-03: RUG::B
2017-02-15 to 2017-02-16: WRUG
```
<!-- .element: class="fragment" -->


# what if we compare<br />with a non-`RUG`?

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
class RUG
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
class RUG
  include Comparable
end

pivorak = RUG.new('Pivorak', Date.new(2017, 1, 20)..Date.new(2017, 1, 21))
rug_b   = RUG.new('RUG::B',  Date.new(2017, 2,  2)..Date.new(2017, 2,  3))
wrug    = RUG.new('WRUG',    Date.new(2017, 2, 15)..Date.new(2017, 2, 16))
pivorak < rug_b                 #=> true
rug_b.between?(pivorak, wrug)   #=> true
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


## my favourite protocol: `#===`

```ruby
require 'date'

def sorting_hat(input)
  case input
  when 'foo', 'bar', 'baz'    then 'so meta!'
  when /rug/i                 then 'a RUG!'
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
puts sorting_hat('WRUG')
puts sorting_hat('good clean fun')
puts sorting_hat(2009)
puts sorting_hat(Date.today.day)
puts sorting_hat(Date.today.month)
```
<!-- .element: class="fragment" -->

```no-highlight
so meta!
a RUG!
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

## there are many protocols in Ruby<br />(like `IO`, or `marshal_dump` + `marshal_load`)
<!-- .element: class="fragment" -->

## do read up on `#coerce`
<!-- .element: class="fragment" -->
