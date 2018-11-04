```ruby
class Conference
  def nav_info(start_lat, start_lon)
    dist = @nav_source.info(from: [start_lat, start_lon], to: [@lat, @lon]).dist
    time = @nav_source.info(from: [start_lat, start_lon], to: [@lat, @lon]).time
    { dist: dist, time: time }
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
class Conference
  def nav_info(start_lat, start_lon)
    info = @nav_source.info(from: [start_lat, start_lon], to: [@lat, @lon])
    dist = info.dist
    time = info.time
    { dist: dist, time: time }
  end
end
```

```ruby
class Conference
  def nav_info(start_lat, start_lon)
    info = @nav_source.info(from: [start_lat, start_lon], to: [@lat, @lon])
    { dist: info.dist, time: info.time }
  end
end
```
<!-- .element: class="fragment" -->

```ruby
class Conference
  def nav_info(start_lat, start_lon)
    @nav_source.info(from: [start_lat, start_lon], to: [@lat, @lon]).to_h
  end
end
```
<!-- .element: class="fragment" -->


```ruby
module ArtDecomp
  class ArchSizer
    def some_size_metric
      case
      when inputs.zero?, outputs.zero? then 0
      when inputs <= 5                 then (outputs / 2.0).ceil
      else [(inputs / 5.0).ceil, (outputs / 2.0).ceil].max
      end
    end
  end
end
```

```ruby
module ArtDecomp
  class ArchSizer
    def some_size_metric
      half_out_ceil = (outputs / 2.0).ceil
      case
      when inputs.zero?, outputs.zero? then 0
      when inputs <= 5                 then half_out_ceil
      else [(inputs / 5.0).ceil, half_out_ceil].max
      end
    end
  end
end
```
<!-- .element: class="fragment" -->


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
  class Seps
    def separates?(row, col)
      actual_row = matrix[row]
      return false unless actual_row
      actual_row[col].nonzero?
    end
  end
end
```
<!-- .element: class="fragment" -->


[![small functions](img/small_functions.png)](https://twitter.com/GonzoHacker/status/831244930270031873)
