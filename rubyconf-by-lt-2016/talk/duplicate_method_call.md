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
