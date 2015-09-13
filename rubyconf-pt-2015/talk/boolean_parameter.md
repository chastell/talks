```ruby
class Conference
  def ruby?(strict = true)
    if strict
      @name.include?('Ruby')
    else
      @name.include?('Ru')
    end
  end
end
```


# boolean parameter

* the caller directly controls calee’s code execution
<!-- .element: class="fragment" -->
* refactoring: split into dedicated methods (classes?)
<!-- .element: class="fragment" -->
* caveat: consider caller usability (less likely)
<!-- .element: class="fragment" -->


```ruby
class Conference
  def surely_ruby?
    @name.include?('Ruby')
  end

  def possibly_ruby?
    @name.include?('Ru')
  end
end
```
