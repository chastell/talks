```ruby
class Conference
  def directions(source_lat, source_lon)
    @nav_source.directions(from: [source_lat, source_lon], to: [@lat, @lon])
  end

  def distance(source_lat, source_lon)
    @nav_source.distance(from: [source_lat, source_lon], to: [@lat, @lon])
  end

  def needs_passport?(source_lat, source_lon)
    @nav_source.borders?(from: [source_lat, source_lon], to: [@lat, @lon])
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


```ruby
Location = Struct.new(:lat, :lon)

class Conference
  def directions(source_location)
    @nav_source.directions(from: source_location, to: @location)
  end

  def distance(source_location)
    @nav_source.distance(from: source_location, to: @location)
  end

  def needs_passport?(source_location)
    @nav_source.borders?(from: source_location, to: @location)
  end
end
```
