!SLIDE

```ruby
require 'yaml/store'
store = YAML::Store.new('sigs.yml')
```

!SLIDE

```ruby
require 'yaml/store'
store = YAML::Store.new('sigs.yml')

store.transaction do







end
```

!SLIDE

```ruby
require 'yaml/store'
store = YAML::Store.new('sigs.yml')

store.transaction do
  store['sigs'] ||= []






end
```

!SLIDE

```ruby
require 'yaml/store'
store = YAML::Store.new('sigs.yml')

store.transaction do
  store['sigs'] ||= []
  store['sigs'].push Sig.new('Florian Gilcher', %w(Ruby Enumerable),
    'Two easy steps to quickly get better at programming Ruby: ' +
    '1) read about enumerable.rb 2) read it again.')



end
```

!SLIDE

```ruby
require 'yaml/store'
store = YAML::Store.new('sigs.yml')

store.transaction do
  store['sigs'] ||= []
  store['sigs'].push Sig.new('Florian Gilcher', %w(Ruby Enumerable),
    'Two easy steps to quickly get better at programming Ruby: ' +
    '1) read about enumerable.rb 2) read it again.')
  store['sigs'].push Sig.new('Theo', %w(Ruby RubyGems),
    'RubyGems 2.0.3: ‘When installing RubyGems on JRuby, the standard ' +
    'library is no longer deleted’ – sounds like a feature to me.')
end
```

!SLIDE

```ruby
require 'yaml/store'
store = YAML::Store.new('sigs.yml')

store.transaction do   # read-write transaction…
  store['sigs'] ||= []
  store['sigs'].push Sig.new('Florian Gilcher', %w(Ruby Enumerable),
    'Two easy steps to quickly get better at programming Ruby: ' +
    '1) read about enumerable.rb 2) read it again.')
  store['sigs'].push Sig.new('Theo', %w(Ruby RubyGems),
    'RubyGems 2.0.3: ‘When installing RubyGems on JRuby, the standard ' +
    'library is no longer deleted’ – sounds like a feature to me.')
end   # …atomically written here
```

!SLIDE

```ruby
require 'yaml/store'
store = YAML::Store.new('sigs.yml')

store.transaction do   # read-write transaction…
  store['sigs'] ||= []
  store['sigs'].push Sig.new('Florian Gilcher', %w(Ruby Enumerable),
    'Two easy steps to quickly get better at programming Ruby: ' +
    '1) read about enumerable.rb 2) read it again.')
  store['sigs'].push Sig.new('Theo', %w(Ruby RubyGems),
    'RubyGems 2.0.3: ‘When installing RubyGems on JRuby, the standard ' +
    'library is no longer deleted’ – sounds like a feature to me.')
end   # …atomically written here

def store.random_sig_tagged_with(tag)
  transaction(true) do   # read-only transaction

  end
end
```

!SLIDE

```ruby
require 'yaml/store'
store = YAML::Store.new('sigs.yml')

store.transaction do   # read-write transaction…
  store['sigs'] ||= []
  store['sigs'].push Sig.new('Florian Gilcher', %w(Ruby Enumerable),
    'Two easy steps to quickly get better at programming Ruby: ' +
    '1) read about enumerable.rb 2) read it again.')
  store['sigs'].push Sig.new('Theo', %w(Ruby RubyGems),
    'RubyGems 2.0.3: ‘When installing RubyGems on JRuby, the standard ' +
    'library is no longer deleted’ – sounds like a feature to me.')
end   # …atomically written here

def store.random_sig_tagged_with(tag)
  transaction(true) do   # read-only transaction
    self['sigs'].select { |sig| sig.tags.include?(tag) }.sample || Sig.new
  end
end
```

!SLIDE

```ruby
require 'yaml/store'
store = YAML::Store.new('sigs.yml')

store.transaction do   # read-write transaction…
  store['sigs'] ||= []
  store['sigs'].push Sig.new('Florian Gilcher', %w(Ruby Enumerable),
    'Two easy steps to quickly get better at programming Ruby: ' +
    '1) read about enumerable.rb 2) read it again.')
  store['sigs'].push Sig.new('Theo', %w(Ruby RubyGems),
    'RubyGems 2.0.3: ‘When installing RubyGems on JRuby, the standard ' +
    'library is no longer deleted’ – sounds like a feature to me.')
end   # …atomically written here

def store.random_sig_tagged_with(tag)
  transaction(true) do   # read-only transaction
    self['sigs'].select { |sig| sig.tags.include?(tag) }.sample || Sig.new
  end
end

puts store.random_sig_tagged_with?('Ruby')

# Two easy steps to quickly get better at programming Ruby:
# 1) read about enumerable.rb 2) read it again.
# — Florian Gilcher
```

!SLIDE commandline incremental

## it’s YAML

    $ cat sigs.yml
    ---
    sigs:
    - !ruby/struct:Sig
      author: Florian Gilcher
      tags:
      - Ruby
      - Enumerable
      text: 'Two easy steps to quickly get better at programming Ruby:
        1) read about enumerable.rb 2) read it again.'
    - !ruby/struct:Sig
      author: Theo
      tags:
      - Ruby
      - RubyGems
      text: 'RubyGems 2.0.3: ‘When installing RubyGems on JRuby, the standard
        library is no longer deleted’ – sounds like a feature to me.'
