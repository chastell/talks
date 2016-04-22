```ruby
class Conference
  def directions(start_location)
    if @location
      @nav_source.directions(from: start_location, to: @location)
    end
  end

  def distance(start_location)
    if @location
      @nav_source.distance(from: start_location, to: @location)
    end
  end

  def needs_passport?(start_location)
    if @location
      @nav_source.borders?(from: start_location, to: @location)
    end
  end
end
```


# repeated conditional

* the same condition is checked in many places
<!-- .element: class="fragment" -->
* refactoring: factor out `LocatedConference`
<!-- .element: class="fragment" -->

* refactoring: make `NavSource` work with `NullLocation`
<!-- .element: class="fragment" -->

* caveat: sometimes readability trumps purer design
<!-- .element: class="fragment" -->
