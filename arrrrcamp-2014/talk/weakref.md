# what if cowsay was expensive?

* we could cache it!
<!-- .element: class="fragment" -->

* but that could get large
<!-- .element: class="fragment" -->

* so let’s (crudely…) auto-expire!
<!-- .element: class="fragment" -->


```ruby
cow_cache = CowCache.new
puts cow_cache.fetch('Node.jk')    # Benjamin W. Smith
puts cow_cache.fetch('fck vwls')   # Gary Bernhardt
puts cow_cache.fetch('Node.jk')
```

```no-highlight
generating a cow for Node.jk
 _________
< Node.jk >
 ---------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

generating a cow for fck vwls
 __________
< fck vwls >
 ----------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
 _________
< Node.jk >
 ---------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```
<!-- .element: class="fragment" -->


## stand back, I KNOW STDLIB

```ruby
require 'forwardable'
require 'logger'
require 'shellwords'

class CowCache
  extend Forwardable

  delegate %i([] keys) => :hash_cache

  alias_method :fetch, :[]

  private

  def generate_cow(text)
    log.debug "generating a cow for #{text}"
    `cowsay #{Shellwords.escape(text)}`
  end

  def hash_cache
    @hash_cache ||= Hash.new do |hash, text|
      hash[text] = generate_cow(text)
    end
  end

  def log
    @log ||= Logger.new($stdout)
  end
end
```


## actually, explicit is sometimes simpler

```ruby
require 'logger'
require 'shellwords'

class CowCache
  def fetch(text)
    hash_cache.fetch(text) do
      hash_cache[text] = generate_cow(text)
    end
  end

  def keys
    hash_cache.keys
  end

  private

  def generate_cow(text)
    log.debug "generating a cow for #{text}"
    `cowsay #{Shellwords.escape(text)}`
  end

  def hash_cache
    @hash_cache ||= {}
  end

  def log
    @log ||= Logger.new($stdout)
  end
end
```


# problem?

* this cache will grow forever
<!-- .element: class="fragment" -->

* if only there was a way to expire it easily…
<!-- .element: class="fragment" -->

* e.g., on garbage collector runs…
<!-- .element: class="fragment" -->


## enter WeakRef!

```ruby
require 'logger'
require 'shellwords'
require 'weakref'

class CowCache
  def fetch(text)
    hash_cache.fetch(text) do
      cow = generate_cow(text)
      hash_cache[text] = WeakRef.new(cow)
    end
  end

  def keys
    hash_cache.keys
  end

  private

  def generate_cow(text)
    log.debug "generating a cow for #{text}"
    `cowsay #{Shellwords.escape(text)}`
  end

  def hash_cache
    @hash_cache ||= {}
  end

  def log
    @log ||= Logger.new($stdout)
  end
end
```


```ruby
cow_cache = CowCache.new
puts cow_cache.fetch('Node.jk')  # Benjamin W. Smith
puts cow_cache.fetch('fck vwls') # Gary Bernhardt
puts cow_cache.fetch('Node.jk')
GC.start
puts cow_cache.fetch('fck vwls')
```

```no-highlight
generating a cow for Node.jk
 _________
< Node.jk >
 ---------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

generating a cow for fck vwls
 __________
< fck vwls >
 ----------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
 _________
< Node.jk >
 ---------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
cache.rb:38:in `puts': Invalid Reference - probably recycled (WeakRef::RefError)
	from cache.rb:38:in `puts'
	from cache.rb:38:in `<main>'
```
<!-- .element: class="fragment" -->


## zombie zombie zombie

```ruby
require 'logger'
require 'shellwords'
require 'weakref'

class CowCache
  def fetch(text)
    cow = hash_cache[text]
    return cow if cow && cow.weakref_alive?
    cow = generate_cow(text)
    hash_cache[text] = WeakRef.new(cow)
  end

  def keys
    hash_cache.keys
  end

  private

  def generate_cow(text)
    log.debug "generating a cow for #{text}"
    `cowsay #{Shellwords.escape(text)}`
  end

  def hash_cache
    @hash_cache ||= {}
  end

  def log
    @log ||= Logger.new($stdout)
  end
end
```


```no-highlight
generating a cow for Node.jk
 _________
< Node.jk >
 ---------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

generating a cow for fck vwls
 __________
< fck vwls >
 ----------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
 _________
< Node.jk >
 ---------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

generating a cow for fck vwls
 __________
< fck vwls >
 ----------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```
