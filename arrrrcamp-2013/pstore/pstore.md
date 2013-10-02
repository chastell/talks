!SLIDE

```ruby
require 'yaml/store'
pstore = YAML::Store.new 'sigs.yml'
```

!SLIDE

```ruby
require 'yaml/store'
pstore = YAML::Store.new 'sigs.yml'

pstore.transaction do









end
```

!SLIDE

```ruby
require 'yaml/store'
pstore = YAML::Store.new 'sigs.yml'

pstore.transaction do
  pstore['sigs'] ||= []








end
```

!SLIDE

```ruby
require 'yaml/store'
pstore = YAML::Store.new 'sigs.yml'

pstore.transaction do
  pstore['sigs'] ||= []

  pstore['sigs'].push Sig.new 'Florian Gilcher', %w[Ruby Enumerable],
    'Two easy steps to quickly get better at programming Ruby: ' +
    '1) read about enumerable.rb 2) read it again.'




end
```

!SLIDE

```ruby
require 'yaml/store'
pstore = YAML::Store.new 'sigs.yml'

pstore.transaction do
  pstore['sigs'] ||= []

  pstore['sigs'].push Sig.new 'Florian Gilcher', %w[Ruby Enumerable],
    'Two easy steps to quickly get better at programming Ruby: ' +
    '1) read about enumerable.rb 2) read it again.'

  pstore['sigs'].push Sig.new 'Theo', %w[Ruby RubyGems],
    'RubyGems 2.0.3: ‘When installing RubyGems on JRuby, the standard ' +
    'library is no longer deleted’ – sounds like a feature to me.'
end
```

!SLIDE

```ruby
require 'yaml/store'
pstore = YAML::Store.new 'sigs.yml'

pstore.transaction do   # read-write transaction…
  pstore['sigs'] ||= []

  pstore['sigs'].push Sig.new 'Florian Gilcher', %w[Ruby Enumerable],
    'Two easy steps to quickly get better at programming Ruby: ' +
    '1) read about enumerable.rb 2) read it again.'

  pstore['sigs'].push Sig.new 'Theo', %w[Ruby RubyGems],
    'RubyGems 2.0.3: ‘When installing RubyGems on JRuby, the standard ' +
    'library is no longer deleted’ – sounds like a feature to me.'
end   # …atomically written here
```

!SLIDE

```ruby
require 'yaml/store'
pstore = YAML::Store.new 'sigs.yml'

pstore.transaction do   # read-write transaction…
  pstore['sigs'] ||= []

  pstore['sigs'].push Sig.new 'Florian Gilcher', %w[Ruby Enumerable],
    'Two easy steps to quickly get better at programming Ruby: ' +
    '1) read about enumerable.rb 2) read it again.'

  pstore['sigs'].push Sig.new 'Theo', %w[Ruby RubyGems],
    'RubyGems 2.0.3: ‘When installing RubyGems on JRuby, the standard ' +
    'library is no longer deleted’ – sounds like a feature to me.'
end   # …atomically written here

      pstore.transaction true do   # read-only transaction

end
```

!SLIDE

```ruby
require 'yaml/store'
pstore = YAML::Store.new 'sigs.yml'

pstore.transaction do   # read-write transaction…
  pstore['sigs'] ||= []

  pstore['sigs'].push Sig.new 'Florian Gilcher', %w[Ruby Enumerable],
    'Two easy steps to quickly get better at programming Ruby: ' +
    '1) read about enumerable.rb 2) read it again.'

  pstore['sigs'].push Sig.new 'Theo', %w[Ruby RubyGems],
    'RubyGems 2.0.3: ‘When installing RubyGems on JRuby, the standard ' +
    'library is no longer deleted’ – sounds like a feature to me.'
end   # …atomically written here

      pstore.transaction true do   # read-only transaction
  pstore['sigs'].select { |sig| sig.tags.include? 'Ruby' }.sample
end
```

!SLIDE

```ruby
require 'yaml/store'
pstore = YAML::Store.new 'sigs.yml'

pstore.transaction do   # read-write transaction…
  pstore['sigs'] ||= []

  pstore['sigs'].push Sig.new 'Florian Gilcher', %w[Ruby Enumerable],
    'Two easy steps to quickly get better at programming Ruby: ' +
    '1) read about enumerable.rb 2) read it again.'

  pstore['sigs'].push Sig.new 'Theo', %w[Ruby RubyGems],
    'RubyGems 2.0.3: ‘When installing RubyGems on JRuby, the standard ' +
    'library is no longer deleted’ – sounds like a feature to me.'
end   # …atomically written here

sig = pstore.transaction true do   # read-only transaction
  pstore['sigs'].select { |sig| sig.tags.include? 'Ruby' }.sample
end

puts sig

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
      text: 'Two easy steps to quickly get better at programming Ruby: 1) read about enumerable.rb
        2) read it again.'
    - !ruby/struct:Sig
      author: Theo
      tags:
      - Ruby
      - RubyGems
      text: 'RubyGems 2.0.3: ‘When installing RubyGems on JRuby, the standard library
        is no longer deleted’ – sounds like a feature to me.'
