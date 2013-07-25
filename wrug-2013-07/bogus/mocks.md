!SLIDE

# mocking

mocks require that the message is sent

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

# mocking

without the `backend.prepare` call the test would fail

```ruby
class Bartender
  def request order, backend: BeerBackend.new
    backend.prepare order
  end
end

class BeerBackend
  def prepare order
  end
end
```
