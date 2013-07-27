!SLIDE

# matchers

```ruby
barliman = fake :bartender

stub(barliman).shout(any_args) { :ignore }

stub(barliman).request('Barliman’s Best', 1) { :always }

stub(barliman).request(anything, 3) { :maybe }

stub(barliman).request(any(String), any(Integer)) { :it_depends }

stub(barliman).request(with { |name| name.include? 'beer' }, 1) { :sure }
```
