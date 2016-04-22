```ruby
class Conference
  def successful?(attendees)
    excited, indifferent = attendees.partition(&:excited?)
    excited.count > indifferent.count
  end
end
```


# utility function

* a method that does not depend on instance state
<!-- .element: class="fragment" -->
* can be moved _anywhere in the system_
<!-- .element: class="fragment" -->

* refactoring: move it to where it belongs
<!-- .element: class="fragment" -->
* caveat: sometimes it’s just a (private?) helper
<!-- .element: class="fragment" -->


```ruby
class Conference
  def successful?
    excited, indifferent = @attendees.partition(&:excited?)
    excited.count > indifferent.count
  end
end
```


```ruby
class Conference
  def successful?
    @attendees.excited?
  end
end
```

```ruby
class Attendees < Array
  def excited?
    excited, indifferent = partition(&:excited?)
    excited.count > indifferent.count
  end
end
```
<!-- .element: class="fragment" -->


```ruby
require 'forwardable'

class Attendees
  extend Forwardable

  def initialize(collection)
    @collection = collection
  end

  def excited?
    excited, indifferent = partition(&:excited?)
    excited.count > indifferent.count
  end

  delegate partition: :@collection
end
```
