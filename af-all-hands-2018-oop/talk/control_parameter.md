```ruby
class Conference
  def interesting?(attendee)
    case attendee
    when 'pythonista' then dynamic?
    when 'rubyist'    then laid_back?
    when 'rustacean'  then system?
    end
  end
end
```


# control parameter

* the caller knows which path the code will take
<!-- .element: class="fragment" -->
* refactoring: split into dedicated methods
<!-- .element: class="fragment" -->
* caveat: consider caller usability (more likely)
<!-- .element: class="fragment" -->


```ruby
class Conference
  def interesting_to_pythonistas?
    dynamic?
  end

  def interesting_to_rubyists?
    laid_back?
  end

  def interesting_to_rustaceans?
    system?
  end
end
```
