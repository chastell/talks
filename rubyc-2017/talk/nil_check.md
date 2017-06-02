```ruby
class Conference
  def initialize(name = nil)
    @name = name
  end

  def acronym?
    !!@name.match(/\A(\p{Upper})+\z/) unless @name.nil?
  end
end
```


# `nil` check

* usually means there’s a missing type in the system
<!-- .element: class="fragment" -->

* refactoring: find the missing type (a null object?)
<!-- .element: class="fragment" -->

* caveat: make sure you don’t sacrifice simplicity
<!-- .element: class="fragment" -->


```ruby
class UnnamedConference
  def acronym?
    false # or is it? :)
  end
end

class Conference
  def self.new(name = nil)
    name ? super : UnnamedConference.new
  end

  def initialize(name)
    @name = name
  end

  def acronym?
    !!@name.match(/\A(\p{Upper})+\z/)
  end
end
```


[![inheritance](img/inheritance_1.png)](https://twitter.com/sarahmei/status/635822455337058304)
[![inheritance](img/inheritance_2.png)](https://twitter.com/sarahmei/status/635999799922196480)
