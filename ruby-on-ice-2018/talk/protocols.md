# protocols

* the basis of Ruby<br />object interoperability
<!-- .element: class="fragment" -->

* cornerstone of Ruby’s<br />duck typing
<!-- .element: class="fragment" -->

* it might be worthwhile to<br />make your objects conformant
<!-- .element: class="fragment" -->


# type conversion

## explicit: `to_x`<br />`to_i`, `to_s`, `to_a`, `to_h`…<br />`' 12 Monkeys '.to_i #=> 12`
<!-- .element: class="fragment" -->

## implicit: `to_xxx`<br />`to_int`, `to_str`, `to_ary`, `to_hash`…<br />for ~equivalent objects, used internally
<!-- .element: class="fragment" -->

## read Avdi Grimm’s [_Confident Ruby_](http://www.confidentruby.com)
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

* two `#hash` calls differ: non-`#eql?`
<!-- .element: class="fragment" -->

* two `#hash` calls equal: check `#eql?`
<!-- .element: class="fragment" -->

* now `Bignum#hash` on Ruby 1.8.6…
<!-- .element: class="fragment" -->


# `#<=>` all the comparables

```ruby
Conf = Struct.new(:name, :dates)

confs = [
  Conf.new('RubyConf PT', Date.new(2014, 10, 13)..Date.new(2014, 10, 14)),
  Conf.new('JRubyConf',   Date.new(2014,  8,  1)..Date.new(2014,  8,  1)),
  Conf.new('eurucamp',    Date.new(2014,  8,  1)..Date.new(2014,  8,  3)),
]
```

```ruby
confs.sort.each &method(:puts)
```
<!-- .element: class="fragment" -->


# `#<=>` all the comparables

```ruby
class Conf < Struct.new(:name, :dates)
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

confs.sort.each &method(:puts)
```

```shell
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

ruby_on_ice  = Conf.new('Ruby on Ice',  Date.new(2018, 1, 26)..Date.new(2018, 1, 28))
isle_of_ruby = Conf.new('Isle of Ruby', Date.new(2018, 4, 13)..Date.new(2018, 4, 15))
balkan_ruby  = Conf.new('Balkan Ruby',  Date.new(2018, 5, 25)..Date.new(2018, 5, 26))

ruby_on_ice < balkan_ruby                         #=> true
isle_of_ruby.between?(ruby_on_ice, balkan_ruby)   #=> true
```
<!-- .element: class="fragment" -->

## `Comparable` provides `#<`, `#<=`, …, also `#between?`
<!-- .element: class="fragment" -->



# `#call`

## anything that responds to `#call`<br />can be replaced by a `Proc` or a `lambda`<br />(or a `Hash#to_proc`…)
<!-- .element: class="fragment" -->

## making your services respond to `#call`<br />means they can be doubled by<br />– and default to – any callable
<!-- .element: class="fragment" -->

## this is a naming trade-off:<br />a more fitting name is often better
<!-- .element: class="fragment" -->


# `Method#to_proc`

```ruby
tables = %i[accounts contacts notes]

def results_for(table)
  "results for #{table}"
end

Hash[tables.zip(tables.map(&method(:results_for)))]
```

```ruby
Hash[tables.zip(tables.map { |table| results_for(table) })]
```
<!-- .element: class="fragment" -->

[![pretzel bun](img/pretzel.png)](https://twitter.com/garybernhardt/status/349920138889404416)
<!-- .element: class="fragment" -->


```ruby
class Asset
  def close_price_on_date(date)
    "close price on #{date}"
  end
end

class Object
  alias_method :&, :method
end

dates = [Date.new(2018, 9, 16), Date.new(2018, 11, 13)]
asset = Asset.new

puts dates.map &asset&:close_price_on_date
```

```ruby
# → puts dates.map(&(asset & :close_price_on_date))
```
<!-- .element: class="fragment" -->

```ruby
# → puts dates.map(&(asset.&(:close_price_on_date)))
```
<!-- .element: class="fragment" -->

```ruby
# → puts dates.map(&(asset.method(:close_price_on_date)))
```
<!-- .element: class="fragment" -->

```ruby
# → puts dates.map { |date| asset.close_price_on_date(date) }
```
<!-- .element: class="fragment" -->

```shell
close price on 2018-09-16
close price on 2018-11-13
```
<!-- .element: class="fragment" -->

```ruby
(1..3).map &User&:find   # via @gabetax
# User Load (6.2ms) SELECT "users".* FROM "users" WHERE "users"."id" = $1 LIMIT 1 [["id", 1]]
# User Load (0.8ms) SELECT "users".* FROM "users" WHERE "users"."id" = $1 LIMIT 1 [["id", 2]]
# User Load (0.4ms) SELECT "users".* FROM "users" WHERE "users"."id" = $1 LIMIT 1 [["id", 3]]
```
<!-- .element: class="fragment" -->


<a href="https://twitter.com/Argorak/status/694599377663426562"><img src="img/message.png" style="width: 100%" /></a>


```ruby
def sorting_hat(input)
  case input
  when 'foo', 'bar', 'baz'    then 'so meta!'
  when /^Ruby/                then 'a Ruby conf!'
  when String                 then 'a string!'
  when 1995..Date.today.year  then 'Ruby existed!'
  when -> (n) { n.odd? }      then 'that’s odd…'
  else 'no clue!'
  end
end
```

```ruby
puts sorting_hat('bar')
puts sorting_hat('Ruby on Ice')
puts sorting_hat('good clean fun')
puts sorting_hat(2009)
puts sorting_hat(Date.today.day)
puts sorting_hat(Date.today.month)
```
<!-- .element: class="fragment" -->

```shell
so meta!
a Ruby conf!
a string!
Ruby existed!
that’s odd…
no clue!
```
<!-- .element: class="fragment" -->

## `#===` is an alias for `Object#==`, `Regexp#match`,<br />`Module#is_a?`, `Range#between?`, `Proc#call`…
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
