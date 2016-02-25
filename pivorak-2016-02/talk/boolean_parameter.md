```ruby
class Meetup
  def ruby?(strict = true)
    if strict
      @languages = ['Ruby']
    else
      @languages.include?('Ruby')
    end
  end
end
```


# boolean parameter

* the caller directly controls calee’s code execution
<!-- .element: class="fragment" -->
* refactoring: split into dedicated methods (classes?)
<!-- .element: class="fragment" -->
* caveat: consider caller usability
<!-- .element: class="fragment" -->


```ruby
class Meetup
  def surely_ruby?
    @languages = ['Ruby']
  end

  def possibly_ruby?
    @languages.include?('Ruby')
  end
end
```
