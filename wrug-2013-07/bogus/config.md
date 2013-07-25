!SLIDE

# config

```ruby
Bogus.configure do |config|
  config.search_modules << MiddleEarth
end

Bogus.fakes do
  fake(:logger) { [LocalScriptorium, ScriptsOverAvianCarriers] }

  fake :fcs, class: proc { FingersCountingService } do
    count 10
  end
end
```
