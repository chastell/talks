# contract tests*

## \* still experimental


## route quality ← time ← airlane

```ruby
describe Navigator do
  describe '#best_route' do
    it 'routes directly for charters' do
      charter = fake(:airline)
      stub(charter).destinations_from('WAW') { %w(FLR) }
      navigator = Navigator.new(charter)
      route = navigator.best_route('WAW', 'FLR')
      expect(route).to eq %w(WAW FLR)
    end

    it 'routes indirectly for scheduled airlines' do
      scheduled = fake(:airline)
      stub(scheduled).destinations_from('WAW') { %w(CDG) }
      stub(scheduled).destinations_from('CDG') { %w(FLR) }
      navigator = Navigator.new(scheduled)
      route = navigator.best_route('WAW', 'FLR')
      expect(route).to eq %w(WAW CDG FLR)
    end
  end
end
```


```ruby
class Airline
  def destinations_from(airport)
  end
end

class Navigator
  def initialize(airlane)
    @airlane = airlane
  end

  def best_route(from, to)
    connection?(from, to) ? [from, to] : indirect_route(from, to)
  end

  private

  def connection?(from, to)
    @airlane.destinations_from(from).include?(to)
  end

  def indirect_route(from, to)
    stops = @airlane.destinations_from(from)
    layover = stops.find { |stop| connection?(stop, to) }
    layover ? [from, layover, to] : fail('¯\ˍ(ツ)ˍ/¯')
  end
end
```


## EU flight regulations are the bestest

```no-highlight
$ rspec navigator_spec.rb
```

```no-highlight
..

Finished in 0.00427 seconds
2 examples, 0 failures
```


## let’s spec `Airline`

```ruby
describe Airline do
  describe '#destinations_from' do
    it 'returns destinations based on type' do
      charter_dsts   = Airline.new('charter').destinations_from('FLR')
      scheduled_dsts = Airline.new('scheduled').destinations_from('FLR')
      expect(charter_dsts).to include 'WAW'
      expect(scheduled_dsts).to_not include 'WAW'
    end
  end
end
```


## let’s implement `Airline`

```ruby
class Airline
  def initialize(type)
    @type = type
  end

  def destinations_from(airport)
    fail '☃☃☃' if airport == 'WAW'   # nevicata!
    case [airport, @type]
    when ['FLR', 'charter']   then %w(WAW)
    when ['FLR', 'scheduled'] then %w(CDG)
    else %w()
    end
  end
end
```


## will it pass?

```no-highlight
$ rspec airlane_spec.rb
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

## but… but… ☃ in WAW means it would blow up…
<!-- .element: class="fragment" -->


# contract tests

* we should test our classes<br />for the actual calls we stub and mock
<!-- .element: class="fragment" -->

* _what if the outgoing call is right<br /> but the collaborator can’t handle it?_
<!-- .element: class="fragment" -->

* can we enforce checking the contract?
<!-- .element: class="fragment" -->


## verify ALL the (`Airline`) contracts!

```ruby
describe Airline do
  verify_contract :airline   # HERE, JUST VERIFY THEM, OKAY?

  describe '#destinations_from' do
    it 'returns destinations based on type' do
      charter_dsts   = Airline.new('charter').destinations_from('FLR')
      scheduled_dsts = Airline.new('scheduled').destinations_from('FLR')
      expect(charter_dsts).to include 'WAW'
      expect(scheduled_dsts).to_not include 'WAW'
    end
  end
end
```


## let’s run both specs together

```no-highlight
$ rspec navigator_spec.rb airlane_spec.rb
```

```no-highlight
…
Bogus::ContractNotFulfilled:
  Contract not fullfilled for airlane!

  Missed interactions:
    - #destinations_from("WAW") => ["FLR"]
    - #destinations_from("WAW") => ["CDG"]
    - #destinations_from("CDG") => ["FLR"]

  Actual interactions:
    - #destinations_from("FLR") => ["WAW"]
    - #destinations_from("FLR") => ["CDG"]
…
```

## we must test `Airline#destinations_from('WAW')`<br />because other stuff depends on it!
<!-- .element: class="fragment" -->
