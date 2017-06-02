```ruby
class Conference
  def directions(start_lat, start_lon)
    @nav_source.directions(from: [start_lat, start_lon], to: [@lat, @lon])
  end

  def distance(start_lat, start_lon)
    @nav_source.distance(from: [start_lat, start_lon], to: [@lat, @lon])
  end

  def needs_passport?(start_lat, start_lon)
    @nav_source.borders?(from: [start_lat, start_lon], to: [@lat, @lon])
  end
end
```


# data clump

* the same set of variables passed in many contexts
<!-- .element: class="fragment" -->

* refactoring: create a composite (value?) object
<!-- .element: class="fragment" -->

* caveat: make sure the clumped variables are related
<!-- .element: class="fragment" -->

* caveat: …and you can decompose them if/when needed
<!-- .element: class="fragment" -->


```ruby
Location = Struct.new(:lat, :lon)

class Conference
  def directions(start_location)
    @nav_source.directions(from: start_location, to: @location)
  end

  def distance(start_location)
    @nav_source.distance(from: start_location, to: @location)
  end

  def needs_passport?(start_location)
    @nav_source.borders?(from: start_location, to: @location)
  end
end
```

```ruby
kiev = Location.new(50.45, 30.52)
lat, lon = *kiev
```
<!-- .element: class="fragment" -->


[![cpu](img/cpu.png)](https://twitter.com/daisyowl/status/841802094361235456)
