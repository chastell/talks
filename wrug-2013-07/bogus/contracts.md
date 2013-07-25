!SLIDE

# experimental: contracts

```ruby
describe Bartender do
  describe '#request' do
    it 'passes the order to the back-end' do
      backend = fake :beer_backend
      Bartender.new.request 'Barliman’s Best', backend: backend
      backend.must_have_received :prepare, ['Barliman’s Best']
    end
  end
end

describe BeerBackend do
  verify_contract :beer_backend
end
```

!SLIDE

# experimental: contracts

```ruby
describe Bartender do
  describe '#request' do
    it 'passes the order to the back-end' do
      backend = fake :beer_backend
      Bartender.new.request 'Barliman’s Best', backend: backend
      backend.must_have_received :prepare, ['Barliman’s Best']
    end
  end
end

describe BeerBackend do
  verify_contract :beer_backend

  describe '#prepare' do
    it 'prepares the order' do
      BeerBackend.new.prepare 'Barliman’s Best'
    end
  end
end
```
