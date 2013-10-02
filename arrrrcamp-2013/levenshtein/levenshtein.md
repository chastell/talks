!SLIDE bullets incremental

## Levenshtein distance

* how different are two strings
* number of edits needed<br />to turn one into the other
* there’s an awesome [`levenshtein` gem](http://rubygems.org/gems/levenshtein)
* but there’s nothing in stdlib
* so let’s NIH it

!SLIDE

```ruby
module Levenshtein
  module_function

  def distance a, b
    matrix = [(0..a.size).to_a] + (1..b.size).map do |n|
      [n] + Array.new(a.size, 0)
    end

    (1..b.size).each do |i|
      (1..a.size).each do |j|
        if a[j-1] == b[i-1]
          matrix[i][j] = matrix[i-1][j-1]
        else
          matrix[i][j] = [matrix[i-1][j], matrix[i][j-1], matrix[i-1][j-1]].min + 1
        end
      end
    end

    matrix.last.last
  end
end
```
based on [Algorithm Implementation/Strings/Levenshtein distance](http://en.wikibooks.org/wiki/Algorithm_Implementation/Strings/Levenshtein_distance#Ruby)

!SLIDE

```ruby
authors = Store.map(&:author).uniq.compact
```

!SLIDE

```ruby
authors = Store.map(&:author).uniq.compact

          authors.combination(2)
```

!SLIDE

```ruby
authors = Store.map(&:author).uniq.compact

          authors.combination(2).min_by do |a1, a2|

end
```

!SLIDE

```ruby
authors = Store.map(&:author).uniq.compact

          authors.combination(2).min_by do |a1, a2|
  Levenshtein.distance a1, a2
end
```

!SLIDE

```ruby
authors = Store.map(&:author).uniq.compact

closest = authors.combination(2).min_by do |a1, a2|
  Levenshtein.distance a1, a2
end

p closest

# ['Maciej Ceglowski', 'Maciej Cegłowski']
```

!SLIDE

```ruby
authors = Store.map(&:author).uniq.compact

closest = authors.combination(2).min_by do |a1, a2|
  Levenshtein.distance a1, a2
end

p closest

# ['Maciej Ceglowski', 'Maciej Cegłowski']

Store.push Sig.new 'Gary Bernhard', %w[Ruby], <<-end
    >> def method_missing(n, *a, &b)
    >>   send(methods.min_by { |m| levenshtein(n.to_s, m.to_s) }, *a, &b)
    >> end
    >> p [1, 2, 3].elngth
    3
    It’s fine.
  end
```
