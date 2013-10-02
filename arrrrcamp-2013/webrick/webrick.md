!SLIDE

```ruby
Store.push Sig.new 'Tom Stuart', %w[Ruby], <<-end
    Ruby: at 2.0, and still has error messages
    like ‘unexpected kEND, expecting $end’.
    If you know what that means, then a Japanese man
    has stolen a significant amount of your brain time.
  end
```

!SLIDE

```ruby
Store.push Sig.new 'Tom Stuart', %w[Ruby], <<-end.gsub(/^ {4}/, '')
    Ruby: at 2.0, and still has error messages
    like ‘unexpected kEND, expecting $end’.
    If you know what that means, then a Japanese man
    has stolen a significant amount of your brain time.
  end
```

!SLIDE

```ruby
Store.push Sig.new 'Tom Stuart', %w[Ruby], <<-end.gsub(/^ {4}/, '').strip
    Ruby: at 2.0, and still has error messages
    like ‘unexpected kEND, expecting $end’.
    If you know what that means, then a Japanese man
    has stolen a significant amount of your brain time.
  end
```

!SLIDE

```ruby
Store.push Sig.new 'Tom Stuart', %w[Ruby], <<-end.gsub(/^ {4}/, '').strip
    Ruby: at 2.0, and still has error messages
    like ‘unexpected kEND, expecting $end’.
    If you know what that means, then a Japanese man
    has stolen a significant amount of your brain time.
  end

Store.push Sig.new 'EHH', %w[Ruby docs], <<-end.gsub(/^ {4}/, '').strip
    ‘I’ll just check the Ruby documentation for this…’
    *clicks*
    *BATS FLY OUT OF MONITOR IN A CLOUD OF DUST*
  end
```

!SLIDE

```ruby
Store.push Sig.new 'Tom Stuart', %w[Ruby], <<-end.gsub(/^ {4}/, '').strip
    Ruby: at 2.0, and still has error messages
    like ‘unexpected kEND, expecting $end’.
    If you know what that means, then a Japanese man
    has stolen a significant amount of your brain time.
  end

Store.push Sig.new 'EHH', %w[Ruby docs], <<-end.gsub(/^ {4}/, '').strip
    ‘I’ll just check the Ruby documentation for this…’
    *clicks*
    *BATS FLY OUT OF MONITOR IN A CLOUD OF DUST*
  end

require 'webrick'

server = WEBrick::HTTPServer.new Port: 1991
```

!SLIDE

```ruby
Store.push Sig.new 'Tom Stuart', %w[Ruby], <<-end.gsub(/^ {4}/, '').strip
    Ruby: at 2.0, and still has error messages
    like ‘unexpected kEND, expecting $end’.
    If you know what that means, then a Japanese man
    has stolen a significant amount of your brain time.
  end

Store.push Sig.new 'EHH', %w[Ruby docs], <<-end.gsub(/^ {4}/, '').strip
    ‘I’ll just check the Ruby documentation for this…’
    *clicks*
    *BATS FLY OUT OF MONITOR IN A CLOUD OF DUST*
  end

require 'webrick'

server = WEBrick::HTTPServer.new Port: 1991








server.start
```

!SLIDE

```ruby
Store.push Sig.new 'Tom Stuart', %w[Ruby], <<-end.gsub(/^ {4}/, '').strip
    Ruby: at 2.0, and still has error messages
    like ‘unexpected kEND, expecting $end’.
    If you know what that means, then a Japanese man
    has stolen a significant amount of your brain time.
  end

Store.push Sig.new 'EHH', %w[Ruby docs], <<-end.gsub(/^ {4}/, '').strip
    ‘I’ll just check the Ruby documentation for this…’
    *clicks*
    *BATS FLY OUT OF MONITOR IN A CLOUD OF DUST*
  end

require 'webrick'

server = WEBrick::HTTPServer.new Port: 1991

server.mount_proc '/' do |request, response|




end

server.start
```

!SLIDE

```ruby
Store.push Sig.new 'Tom Stuart', %w[Ruby], <<-end.gsub(/^ {4}/, '').strip
    Ruby: at 2.0, and still has error messages
    like ‘unexpected kEND, expecting $end’.
    If you know what that means, then a Japanese man
    has stolen a significant amount of your brain time.
  end

Store.push Sig.new 'EHH', %w[Ruby docs], <<-end.gsub(/^ {4}/, '').strip
    ‘I’ll just check the Ruby documentation for this…’
    *clicks*
    *BATS FLY OUT OF MONITOR IN A CLOUD OF DUST*
  end

require 'webrick'

server = WEBrick::HTTPServer.new Port: 1991

server.mount_proc '/' do |request, response|
  tag = request.query['tag']



end

server.start
```

!SLIDE

```ruby
Store.push Sig.new 'Tom Stuart', %w[Ruby], <<-end.gsub(/^ {4}/, '').strip
    Ruby: at 2.0, and still has error messages
    like ‘unexpected kEND, expecting $end’.
    If you know what that means, then a Japanese man
    has stolen a significant amount of your brain time.
  end

Store.push Sig.new 'EHH', %w[Ruby docs], <<-end.gsub(/^ {4}/, '').strip
    ‘I’ll just check the Ruby documentation for this…’
    *clicks*
    *BATS FLY OUT OF MONITOR IN A CLOUD OF DUST*
  end

require 'webrick'

server = WEBrick::HTTPServer.new Port: 1991

server.mount_proc '/' do |request, response|
  tag = request.query['tag']
  sig = Store.random_sig_tagged_with tag


end

server.start
```

!SLIDE

```ruby
Store.push Sig.new 'Tom Stuart', %w[Ruby], <<-end.gsub(/^ {4}/, '').strip
    Ruby: at 2.0, and still has error messages
    like ‘unexpected kEND, expecting $end’.
    If you know what that means, then a Japanese man
    has stolen a significant amount of your brain time.
  end

Store.push Sig.new 'EHH', %w[Ruby docs], <<-end.gsub(/^ {4}/, '').strip
    ‘I’ll just check the Ruby documentation for this…’
    *clicks*
    *BATS FLY OUT OF MONITOR IN A CLOUD OF DUST*
  end

require 'webrick'

server = WEBrick::HTTPServer.new Port: 1991

server.mount_proc '/' do |request, response|
  tag = request.query['tag']
  sig = Store.random_sig_tagged_with tag
  response['Content-Type'] = 'text/plain; charset=UTF-8'
  response.body = sig.to_s
end

server.start
```

!SLIDE commandline incremental

## we have a sig webservice!

    $ curl localhost:1991/?tag=Ruby
    Ruby: at 2.0, and still has error messages
    like ‘unexpected kEND, expecting $end’.
    If you know what that means, then a Japanese man
    has stolen a significant amount of your brain time.
    — Tom Stuart

    $ curl localhost:1991/?tag=Ruby
    ‘I’ll just check the Ruby documentation for this…’
    *clicks*
    *BATS FLY OUT OF MONITOR IN A CLOUD OF DUST*
    — EHH
