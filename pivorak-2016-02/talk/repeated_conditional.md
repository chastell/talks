```ruby
class Meetup
  def directions(source_location)
    if @location
      @nav_source.directions(from: source_location, to: @location)
    end
  end

  def distance(source_location)
    if @location
      @nav_source.distance(from: source_location, to: @location)
    end
  end

  def needs_passport?(source_location)
    if @location
      @nav_source.borders?(from: source_location, to: @location)
    end
  end
end
```


# repeated conditional

* the same condition is checked in many places
<!-- .element: class="fragment" -->
* refactoring: factor out `LocatedMeetup`
<!-- .element: class="fragment" -->

* refactoring: make `NavSource` work with `NullLocation`
<!-- .element: class="fragment" -->

* caveat: sometimes readability trumps purer design
<!-- .element: class="fragment" -->
