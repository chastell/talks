!SLIDE

# spying

mocks state the requirement first

```ruby
describe Bartender do
  describe '#request' do
    it 'passes the order to the back-end' do
      backend = fake :beer_backend
      mock(backend).prepare 'Barliman’s Best'
      Bartender.new.request 'Barliman’s Best', backend: backend
    end
  end
end
```

!SLIDE

# spying

spies describe what should’ve happended

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
```
