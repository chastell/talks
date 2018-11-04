```ruby
class Conference
  def successful?(attendees)
    excited, indifferent = attendees.partition do |attendee|
      attendee.excited? || @language == 'Ruby' && attendee.rubyist?
    end
    excited.count > indifferent.count
  end
end
```


# feature envy

* partially refers to instance, but mostly to arguments
<!-- .element: class="fragment" -->
* refactoring: move code to one of the arguments
<!-- .element: class="fragment" -->
* caveat: make sure the knowledge is local to the problem
<!-- .element: class="fragment" -->


```ruby
class Conference
  def successful?
    @attendees.excited?(language: @language)
  end
end
```

```ruby
class Attendees
  def excited?(language: nil)
    excited, indifferent = partition { |att| att.excited?(language: language) }
    excited.count > indifferent.count
  end
end
```
<!-- .element: class="fragment" -->

```ruby
class Attendee
  def excited?(language: nil)
    @excited || @rubyist && language == 'Ruby'
  end
end
```
<!-- .element: class="fragment" -->


[![half 1](img/half.1.png)](https://twitter.com/tenderlove/status/798637206738829312)

[![half 2](img/half.2.png)](https://twitter.com/tenderlove/status/798637313311940608)
<!-- .element: class="fragment" -->
