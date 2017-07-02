# Ruby (franken)gems

* <span class="fragment">[`json`](https://github.com/flori/json)<br />`JSON::Pure` (Ruby) vs `JSON::Ext` (C | Java)</span>
* <span class="fragment">[`levenshtein`](https://rubygems.org/gems/levenshtein)<br />C with transparent fallback to Ruby<br />two `String`s | two `Array`s | two `[#hash + #eql?]#each`</span>
* <span class="fragment">[`fast_blank`](https://github.com/SamSaffron/fast_blank)<br />faster `String#blank?`</span>


# `fast_blank` vs slow blank

```ruby
class String
  def slow_blank?
    /\A[[:space:]]*\z/ === self
  end

  def new_slow_blank?
    empty? || !(/[[:^space:]]/ === self)
  end
end
```


## `fast_blank` vs new slow blank…?

```nohighlight
================== Test String Length: 0 ==================
Warming up --------------------------------------
          Fast Blank   413.184k i/100ms
  Fast ActiveSupport   398.877k i/100ms
          Slow Blank   147.941k i/100ms
      New Slow Blank   395.928k i/100ms
Calculating -------------------------------------
          Fast Blank     29.925M (± 1.1%) i/s -    149.986M in   5.012685s
  Fast ActiveSupport     29.607M (± 1.3%) i/s -    148.382M in   5.012550s
          Slow Blank      2.208M (± 1.2%) i/s -     11.096M in   5.026964s
      New Slow Blank     25.843M (± 0.9%) i/s -    129.468M in   5.010180s

Comparison:
          Fast Blank: 29924932.6 i/s
  Fast ActiveSupport: 29606940.0 i/s - same-ish: difference falls within error
      New Slow Blank: 25843115.7 i/s - 1.16x  slower
          Slow Blank:  2207560.0 i/s - 13.56x  slower
```


## …`fast_blank` vs new slow blank!

```nohighlight
================== Test String Length: 14 ==================
Warming up --------------------------------------
          Fast Blank   402.336k i/100ms
  Fast ActiveSupport   393.394k i/100ms
          Slow Blank   221.874k i/100ms
      New Slow Blank   145.214k i/100ms
Calculating -------------------------------------
          Fast Blank     26.389M (± 1.2%) i/s -    131.966M in   5.001586s
  Fast ActiveSupport     26.418M (± 1.0%) i/s -    132.180M in   5.003849s
          Slow Blank      4.528M (± 1.0%) i/s -     22.853M in   5.047845s
      New Slow Blank      2.161M (± 0.9%) i/s -     10.891M in   5.041227s

Comparison:
  Fast ActiveSupport: 26418172.4 i/s
          Fast Blank: 26388891.6 i/s - same-ish: difference falls within error
          Slow Blank:  4527725.3 i/s - 5.83x  slower
      New Slow Blank:  2160594.0 i/s - 12.23x  slower
```


[![gif](img/gif.png)](https://twitter.com/alexandraerin/status/875470627045552133)
