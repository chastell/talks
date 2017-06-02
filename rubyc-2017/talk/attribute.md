```ruby
class Conference
  def initialize(city:, name:)
    @city = city
    @name = name
  end

  attr_accessor :city, :name
end
```


# attribute

* setters: bad
<!-- .element: class="fragment" -->
* getters: _it depends_
<!-- .element: class="fragment" -->

* refactoring: tell, don’t ask
<!-- .element: class="fragment" -->

* refactoring: immutability via `#with`
<!-- .element: class="fragment" -->

* caveat: an overkill in simplest (riiight…) projects
<!-- .element: class="fragment" -->


```ruby
class Conference
  def initialize(city:, name:)
    @city = city
    @name = name
  end

  attr_reader :city, :name

  def with(city: @city, name: @name)
    self.class.new(city: city, name: name)
  end
end
```

```ruby
polyconf_2016 = Conference.new(city: 'Poznań', name: 'PolyConf')
polyconf_2017 = polyconf_2016.with(city: 'Paris')
```
<!-- .element: class="fragment" -->


<!-- .slide: data-background="black" -->
[![Burn Your Getters](img/tom.png)](https://github.com/jcoglan/burn-your-getters)
<!-- .element: class="tom" -->
