!SLIDE

```ruby
Store.push Sig.new 'Gary Bernhardt', %w[Ruby], <<-end.gsub(/^ {4}/, '').strip
    Yes, I am a princess and Kernel#test is a pea. I don’t care. These
    are the thousand cuts that make Ruby so difficult to reason about.
    The real question here is: who is the mattress?
  end
```

!SLIDE

```ruby
Store.push Sig.new 'Gary Bernhardt', %w[Ruby], <<-end.gsub(/^ {4}/, '').strip
    Yes, I am a princess and Kernel#test is a pea. I don’t care. These
    are the thousand cuts that make Ruby so difficult to reason about.
    The real question here is: who is the mattress?
  end
Store.push Sig.new 'Tim Pope', %w[Ruby BigDecimal], <<-end.gsub(/^ {4}/, '').strip
    I wonder if the guy that wrote BigDecimal#inspect has
    a tragic backstory that explains why he hates humanity.
  end
```

!SLIDE

```ruby
Store.push Sig.new 'Gary Bernhardt', %w[Ruby], <<-end.gsub(/^ {4}/, '').strip
    Yes, I am a princess and Kernel#test is a pea. I don’t care. These
    are the thousand cuts that make Ruby so difficult to reason about.
    The real question here is: who is the mattress?
  end
Store.push Sig.new 'Tim Pope', %w[Ruby BigDecimal], <<-end.gsub(/^ {4}/, '').strip
    I wonder if the guy that wrote BigDecimal#inspect has
    a tragic backstory that explains why he hates humanity.
  end

require 'gserver'

class SigServer < GServer






end
```

!SLIDE

```ruby
Store.push Sig.new 'Gary Bernhardt', %w[Ruby], <<-end.gsub(/^ {4}/, '').strip
    Yes, I am a princess and Kernel#test is a pea. I don’t care. These
    are the thousand cuts that make Ruby so difficult to reason about.
    The real question here is: who is the mattress?
  end
Store.push Sig.new 'Tim Pope', %w[Ruby BigDecimal], <<-end.gsub(/^ {4}/, '').strip
    I wonder if the guy that wrote BigDecimal#inspect has
    a tragic backstory that explains why he hates humanity.
  end

require 'gserver'

class SigServer < GServer
  def serve io




  end
end
```

!SLIDE

```ruby
Store.push Sig.new 'Gary Bernhardt', %w[Ruby], <<-end.gsub(/^ {4}/, '').strip
    Yes, I am a princess and Kernel#test is a pea. I don’t care. These
    are the thousand cuts that make Ruby so difficult to reason about.
    The real question here is: who is the mattress?
  end
Store.push Sig.new 'Tim Pope', %w[Ruby BigDecimal], <<-end.gsub(/^ {4}/, '').strip
    I wonder if the guy that wrote BigDecimal#inspect has
    a tragic backstory that explains why he hates humanity.
  end

require 'gserver'

class SigServer < GServer
  def serve io
    io.write 'tag: '



  end
end
```

!SLIDE

```ruby
Store.push Sig.new 'Gary Bernhardt', %w[Ruby], <<-end.gsub(/^ {4}/, '').strip
    Yes, I am a princess and Kernel#test is a pea. I don’t care. These
    are the thousand cuts that make Ruby so difficult to reason about.
    The real question here is: who is the mattress?
  end
Store.push Sig.new 'Tim Pope', %w[Ruby BigDecimal], <<-end.gsub(/^ {4}/, '').strip
    I wonder if the guy that wrote BigDecimal#inspect has
    a tragic backstory that explains why he hates humanity.
  end

require 'gserver'

class SigServer < GServer
  def serve io
    io.write 'tag: '
    tag = io.gets.chomp


  end
end
```

!SLIDE

```ruby
Store.push Sig.new 'Gary Bernhardt', %w[Ruby], <<-end.gsub(/^ {4}/, '').strip
    Yes, I am a princess and Kernel#test is a pea. I don’t care. These
    are the thousand cuts that make Ruby so difficult to reason about.
    The real question here is: who is the mattress?
  end
Store.push Sig.new 'Tim Pope', %w[Ruby BigDecimal], <<-end.gsub(/^ {4}/, '').strip
    I wonder if the guy that wrote BigDecimal#inspect has
    a tragic backstory that explains why he hates humanity.
  end

require 'gserver'

class SigServer < GServer
  def serve io
    io.write 'tag: '
    tag = io.gets.chomp
    sig = Store.random_sig_tagged_with tag

  end
end
```

!SLIDE

```ruby
Store.push Sig.new 'Gary Bernhardt', %w[Ruby], <<-end.gsub(/^ {4}/, '').strip
    Yes, I am a princess and Kernel#test is a pea. I don’t care. These
    are the thousand cuts that make Ruby so difficult to reason about.
    The real question here is: who is the mattress?
  end
Store.push Sig.new 'Tim Pope', %w[Ruby BigDecimal], <<-end.gsub(/^ {4}/, '').strip
    I wonder if the guy that wrote BigDecimal#inspect has
    a tragic backstory that explains why he hates humanity.
  end

require 'gserver'

class SigServer < GServer
  def serve io
    io.write 'tag: '
    tag = io.gets.chomp
    sig = Store.random_sig_tagged_with tag
    io.puts sig
  end
end
```

!SLIDE

```ruby
Store.push Sig.new 'Gary Bernhardt', %w[Ruby], <<-end.gsub(/^ {4}/, '').strip
    Yes, I am a princess and Kernel#test is a pea. I don’t care. These
    are the thousand cuts that make Ruby so difficult to reason about.
    The real question here is: who is the mattress?
  end
Store.push Sig.new 'Tim Pope', %w[Ruby BigDecimal], <<-end.gsub(/^ {4}/, '').strip
    I wonder if the guy that wrote BigDecimal#inspect has
    a tragic backstory that explains why he hates humanity.
  end

require 'gserver'

class SigServer < GServer
  def serve io
    io.write 'tag: '
    tag = io.gets.chomp
    sig = Store.random_sig_tagged_with tag
    io.puts sig
  end
end

sig_server = SigServer.new 1969
```

!SLIDE

```ruby
Store.push Sig.new 'Gary Bernhardt', %w[Ruby], <<-end.gsub(/^ {4}/, '').strip
    Yes, I am a princess and Kernel#test is a pea. I don’t care. These
    are the thousand cuts that make Ruby so difficult to reason about.
    The real question here is: who is the mattress?
  end
Store.push Sig.new 'Tim Pope', %w[Ruby BigDecimal], <<-end.gsub(/^ {4}/, '').strip
    I wonder if the guy that wrote BigDecimal#inspect has
    a tragic backstory that explains why he hates humanity.
  end

require 'gserver'

class SigServer < GServer
  def serve io
    io.write 'tag: '
    tag = io.gets.chomp
    sig = Store.random_sig_tagged_with tag
    io.puts sig
  end
end

sig_server = SigServer.new 1969
sig_server.start
```

!SLIDE

```ruby
Store.push Sig.new 'Gary Bernhardt', %w[Ruby], <<-end.gsub(/^ {4}/, '').strip
    Yes, I am a princess and Kernel#test is a pea. I don’t care. These
    are the thousand cuts that make Ruby so difficult to reason about.
    The real question here is: who is the mattress?
  end
Store.push Sig.new 'Tim Pope', %w[Ruby BigDecimal], <<-end.gsub(/^ {4}/, '').strip
    I wonder if the guy that wrote BigDecimal#inspect has
    a tragic backstory that explains why he hates humanity.
  end

require 'gserver'

class SigServer < GServer
  def serve io
    io.write 'tag: '
    tag = io.gets.chomp
    sig = Store.random_sig_tagged_with tag
    io.puts sig
  end
end

sig_server = SigServer.new 1969
sig_server.start
sig_server.join
```

!SLIDE commandline incremental

## `telnet towel.blinkenlights.nl`

    $ telnet localhost 1969
    Trying 127.0.0.1...
    Connected to localhost.
    Escape character is '^]'.
    tag: Ruby
    Yes, I am a princess and Kernel#test is a pea. I don’t care. These
    are the thousand cuts that make Ruby so difficult to reason about.
    The real question here is: who is the mattress?
    — Gary Bernhardt
    Connection closed by foreign host.

    $ telnet localhost 1969
    Trying 127.0.0.1...
    Connected to localhost.
    Escape character is '^]'.
    tag: BigDecimal
    I wonder if the guy that wrote BigDecimal#inspect has
    a tragic backstory that explains why he hates humanity.
    — Tim Pope
    Connection closed by foreign host.
