!SLIDE

# stubbing

stub methods on fake definition

```ruby
describe BeerOrder do
  describe '#size' do
    it 'returns the number of ordered beers' do
      gollum = Person.new 'Gollum'
      fcs    = fake :fingers_counting_service, count: 10

      BeerOrder.new(gollum).size(fcs: fcs).must_equal 5
    end
  end
end
```

!SLIDE

# stubbing

Bogus makes you implement all of the following

```ruby
class FingersCountingService
  def count
  end
end

class BeerOrder
  def initialize person
  end

  def size fcs: FingersCountingService.new
    fcs.count / 2
  end
end
```

!SLIDE

# stubbing

stub special-case method calls

```ruby
describe BeerOrder do
  describe '#size' do
    it 'returns the average number of ordered beers' do
      gollum = Person.new 'Gollum'
      frodo  = Person.new 'Frodo'

      fcs = fake :fingers_counting_service, count: 10
      stub(fcs).count(frodo) { 9 }

      BeerOrder.new(gollum).size(fcs: fcs).must_equal 5
      BeerOrder.new(frodo).size(fcs: fcs).must_equal 4.5
    end
  end
end
```

!SLIDE

# stubbing

Bogus pushes for `FingersCountingService#count`’s parameter

```ruby
class FingersCountingService
  def count person
  end
end

class BeerOrder
  attr_reader :person

  def initialize person
    @person = person
  end

  def size fcs: FingersCountingService.new
    fcs.count(person) / 2.0
  end
end
```
