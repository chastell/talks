!SLIDE

```ruby
# let’s ignore the ‘Struct is almost never a good idea’ discussion for a sec
Sig = Struct.new :author, :tags, :text
```

!SLIDE

```ruby
# let’s ignore the ‘Struct is almost never a good idea’ discussion for a sec
Sig = Struct.new :author, :tags, :text





# I live in a simple world
Store = []






Store.push Sig.new
```

!SLIDE

```ruby
# let’s ignore the ‘Struct is almost never a good idea’ discussion for a sec
Sig = Struct.new :author, :tags, :text





# I live in a simple world
Store = []






Store.push Sig.new 'Chris Wanstrath',
```

!SLIDE

```ruby
# let’s ignore the ‘Struct is almost never a good idea’ discussion for a sec
Sig = Struct.new :author, :tags, :text





# I live in a simple world
Store = []






Store.push Sig.new 'Chris Wanstrath', ['Ruby', 'Enumerable'],
```

!SLIDE

```ruby
# let’s ignore the ‘Struct is almost never a good idea’ discussion for a sec
Sig = Struct.new :author, :tags, :text





# I live in a simple world
Store = []






Store.push Sig.new 'Chris Wanstrath', ['Ruby', 'Enumerable'],
  'Every time I use Ruby’s Enumerable#partition I want to give matz a high five.'
```

!SLIDE

```ruby
# let’s ignore the ‘Struct is almost never a good idea’ discussion for a sec
Sig = Struct.new :author, :tags, :text





# I live in a simple world
Store = []






Store.push Sig.new 'Chris Wanstrath', ['Ruby', 'Enumerable'],
  'Every time I use Ruby’s Enumerable#partition I want to give matz a high five.'

Store << Sig[%q[James Coglan], %w[Ruby Bundler Unicorn],
  %q[I’m a professional programmer, I type ‘be unicorn’ to start my webserver.]]
```

!SLIDE

```ruby
# let’s ignore the ‘Struct is almost never a good idea’ discussion for a sec
Sig = Struct.new :author, :tags, :text





# I live in a simple world
Store = []

# because we can
def Store.random_sig_tagged_with tag
  select { |sig| sig.tags.include? tag }.sample
end

Store.push Sig.new 'Chris Wanstrath', ['Ruby', 'Enumerable'],
  'Every time I use Ruby’s Enumerable#partition I want to give matz a high five.'

Store << Sig[%q[James Coglan], %w[Ruby Bundler Unicorn],
  %q[I’m a professional programmer, I type ‘be unicorn’ to start my webserver.]]
```

!SLIDE

```ruby
# let’s ignore the ‘Struct is almost never a good idea’ discussion for a sec
Sig = Struct.new :author, :tags, :text





# I live in a simple world
Store = []

# because we can
def Store.random_sig_tagged_with tag
  select { |sig| sig.tags.include? tag }.sample || Sig.new
end

Store.push Sig.new 'Chris Wanstrath', ['Ruby', 'Enumerable'],
  'Every time I use Ruby’s Enumerable#partition I want to give matz a high five.'

Store << Sig[%q[James Coglan], %w[Ruby Bundler Unicorn],
  %q[I’m a professional programmer, I type ‘be unicorn’ to start my webserver.]]
```

!SLIDE

```ruby
# let’s ignore the ‘Struct is almost never a good idea’ discussion for a sec
Sig = Struct.new :author, :tags, :text





# I live in a simple world
Store = []

# because we can
def Store.random_sig_tagged_with tag
  select { |sig| sig.tags.include? tag }.sample || Sig.new
end

Store.push Sig.new 'Chris Wanstrath', ['Ruby', 'Enumerable'],
  'Every time I use Ruby’s Enumerable#partition I want to give matz a high five.'

Store << Sig[%q[James Coglan], %w[Ruby Bundler Unicorn],
  %q[I’m a professional programmer, I type ‘be unicorn’ to start my webserver.]]

     Store.random_sig_tagged_with 'Ruby'
```

!SLIDE

```ruby
# let’s ignore the ‘Struct is almost never a good idea’ discussion for a sec
Sig = Struct.new :author, :tags, :text do
  def to_s
    "#{text}\n— #{author}\n"
  end
end

# I live in a simple world
Store = []

# because we can
def Store.random_sig_tagged_with tag
  select { |sig| sig.tags.include? tag }.sample || Sig.new
end

Store.push Sig.new 'Chris Wanstrath', ['Ruby', 'Enumerable'],
  'Every time I use Ruby’s Enumerable#partition I want to give matz a high five.'

Store << Sig[%q[James Coglan], %w[Ruby Bundler Unicorn],
  %q[I’m a professional programmer, I type ‘be unicorn’ to start my webserver.]]

     Store.random_sig_tagged_with 'Ruby'
```

!SLIDE

```ruby
# let’s ignore the ‘Struct is almost never a good idea’ discussion for a sec
Sig = Struct.new :author, :tags, :text do
  def to_s
    "#{text}\n— #{author}\n"
  end
end

# I live in a simple world
Store = []

# because we can
def Store.random_sig_tagged_with tag
  select { |sig| sig.tags.include? tag }.sample || Sig.new
end

Store.push Sig.new 'Chris Wanstrath', ['Ruby', 'Enumerable'],
  'Every time I use Ruby’s Enumerable#partition I want to give matz a high five.'

Store << Sig[%q[James Coglan], %w[Ruby Bundler Unicorn],
  %q[I’m a professional programmer, I type ‘be unicorn’ to start my webserver.]]

puts Store.random_sig_tagged_with 'Ruby'

# I’m a professional programmer, I type ‘be unicorn’ to start my webserver.
# — James Coglan
```

!SLIDE bullets incremental

## disclaimers

* the examples are somewhat contrived<br />but see past them to your own applications
* there are pieces of Ruby _core_<br />sprinkled throughout
* <span class='quote' style='width: 100%'>Tech talk template: I don’t know what I’m doing, and here’s how.<br />— Pinboard</span>
