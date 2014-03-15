# contract tests*

## \* still experimental


## route cost ← full tank range ← average speed

```ruby
describe Navigator do
  describe '#cheapest_route' do
    it 'routes through A2 for fast cars' do
      camaro = fake :vehicle
      stub(camaro).full_tank_range_at(50) { 428 }   # a fast car consumes
      stub(camaro).full_tank_range_at(90) { 771 }   # less petrol at 90
      navigator = Navigator.new camaro
      route     = navigator.cheapest_route from: 'Warsaw', to: 'Wrocław'
      expect(route).to eq %w(A2 25 11 S8)
    end

    it 'routes through E67 for slow cars' do
      clio = fake :vehicle
      stub(clio).full_tank_range_at(50) { 840 }     # a slow car consumes
      stub(clio).full_tank_range_at(90) { 466 }     # less petrol at 50
      navigator = Navigator.new clio
      route     = navigator.cheapest_route from: 'Warsaw', to: 'Wrocław'
      expect(route).to eq %w(E67)
    end
  end
end
```


## let’s rage a bit about<br />Ruby 2.1’s required kwarg syntax

```ruby
class Navigator
  def initialize vehicle
    @vehicle = vehicle
  end

  def cheapest_route(from:, to:)
    fail 'no clue whatsoever' unless from == 'Warsaw' and to == 'Wrocław'
    fast_range = @vehicle.full_tank_range_at 90
    slow_range = @vehicle.full_tank_range_at 50
    fast_range > slow_range ? %w(A2 25 11 S8) : %w(E67)
  end
end

class Vehicle
  def full_tank_range_at speed
  end
end
```


## Polish roads are the bestest

```no-highlight
$ rspec navigator_spec.rb
```

```no-highlight
..

Finished in 0.00427 seconds
2 examples, 0 failures
```


## let’s spec `Vehicle`

```ruby
describe Vehicle do
  describe '#full_tank_range_at' do
    it 'calculates range based on model' do
      camaro_range = Vehicle.new('camaro').full_tank_range_at 50
      clio_range   = Vehicle.new('clio').full_tank_range_at 50
      expect(camaro_range).to be < clio_range
    end
  end
end
```


## let’s implement `Vehicle`

```ruby
class Vehicle
  def initialize model
    @model = model
  end

  def full_tank_range_at speed
    fail 'drive safely' if speed > 80     # SAFETY FIRST
    case @model
    when 'camaro' then 600 * speed / 70
    when 'clio'   then 600 * 70 / speed
    end
  end
end
```


## will it pass?

```no-highlight
$ rspec vehicle_spec.rb
```
<!-- .element: class="fragment" -->

```no-highlight
.

Finished in 0.00241 seconds
1 example, 0 failures
```
<!-- .element: class="fragment" -->

```no-highlight
$ rspec navigator_spec.rb
```
<!-- .element: class="fragment" -->

```no-highlight
..

Finished in 0.00592 seconds
2 examples, 0 failures
```
<!-- .element: class="fragment" -->

## but… but… `Vehicle` blows up with speeds over 80…
<!-- .element: class="fragment" -->


# contract tests

## we should test our classes<br />for the actuall calls we stub and mock
<!-- .element: class="fragment" -->

## _what if the outgoing call is right<br /> but the collaborator can’t handle it?_
<!-- .element: class="fragment" -->

## can we enforce checking the contract?
<!-- .element: class="fragment" -->


## verify ALL the (`Vehicle`) contracts!

```ruby
describe Vehicle do
  verify_contract :vehicle   # HERE, JUST VERIFY THEM, OKAY?

  describe '#full_tank_range_at' do
    it 'calculates range based on model' do
      camaro_range = Vehicle.new('camaro').full_tank_range_at 50
      clio_range   = Vehicle.new('clio').full_tank_range_at 50
      expect(camaro_range).to be < clio_range
    end
  end
end
```


## let’s run both specs together

```no-highlight
$ rspec navigator_spec.rb vehicle_spec.rb
```

```no-highlight
...

Finished in 0.00553 seconds
3 examples, 0 failures
…: Contract not fullfilled for vehicle! (Bogus::ContractNotFulfilled)

Missed interactions:
  - #full_tank_range_at(90) => 771
  - #full_tank_range_at(90) => 466

Actual interactions:
  - #full_tank_range_at(50) => 428
  - #full_tank_range_at(50) => 840

```

## we must test `Vehicle#full_tank_range_at(90)`<br />because other stuff depends on it!
<!-- .element: class="fragment" -->
