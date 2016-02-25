```ruby
class Meetup
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
* refactoring: immutability via `#update` (or `#with`)
<!-- .element: class="fragment" -->

* caveat: an overkill in simplest (riiight…) projects
<!-- .element: class="fragment" -->


```ruby
class Meetup
  def initialize(city:, name:)
    @city = city
    @name = name
  end

  attr_reader :city, :name

  def update(city: @city, name: @name)
    self.class.new(city: city, name: name)
  end
end
```


<!-- .slide: data-background="black" -->
[![Burn Your Getters](img/tom.png)](https://github.com/jcoglan/burn-your-getters)
<!-- .element: class="tom" -->
