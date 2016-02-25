```ruby
class Meetup
  def weather_assessment
    if @weather_source.weather_at(@city).skies == :clear
      'Too sunny'
    elsif @weather_source.weather_at(@city).temp > 20
      'Too hot'
    else
      'Perfect for coding'
    end
  end
end
```


# duplicate method call

* the same call made more than once
<!-- .element: class="fragment" -->
* refactoring: factor out a single call
<!-- .element: class="fragment" -->
* caveat: readability
<!-- .element: class="fragment" -->


```ruby
class Meetup
  def weather_assessment
    weather = @weather_source.weather_at(@city)
    if weather.skies == :clear
      'Too sunny'
    elsif weather.temp > 20
      'Too hot'
    else
      'Perfect for coding'
    end
  end
end
```


```ruby
module ArtDecomp
  class Seps
    def separates?(row, col)
      matrix[row] and matrix[row][col].nonzero?
    end
  end
end
```

```ruby
module ArtDecomp
  class ArchSizer
    def min_quarters
      case
      when i.zero?, o.zero? then 0
      when i <= 5           then (o / 2.0).ceil
      else [(i / 5.0).ceil, (o / 2.0).ceil].max
      end
    end
  end
end
```
<!-- .element: class="fragment" -->
