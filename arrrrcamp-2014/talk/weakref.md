# what if cowsay<br />was expensive?

* we could cache it!
<!-- .element: class="fragment" -->

* but the cache could get large…
<!-- .element: class="fragment" -->

* oh c’mon, what can be simpler<br />than cache expiration?
<!-- .element: class="fragment" -->


```ruby
cow_cache = CowCache.new
puts cow_cache.fetch('Node.jk')    # Benjamin W. Smith
puts cow_cache.fetch('fck vwls')   # Gary Bernhardt
puts cow_cache.fetch('Node.jk')
```

```no-highlight
D, [#23422] DEBUG -- : generating a cow for Node.jk
 _________
< Node.jk >
 ---------
 \
  \
   \ >()_
      (__)__ _
D, [#23422] DEBUG -- : generating a cow for fck vwls
 __________
< fck vwls >
 ----------
 \
  \
   \ >()_
      (__)__ _
 _________
< Node.jk >
 ---------
 \
  \
   \ >()_
      (__)__ _
```
<!-- .element: class="fragment" -->


## stand back, I KNOW STDLIB

```ruby
require 'forwardable'   # (13 yo)
require 'logger'        # (11 yo)
require 'shellwords'

class CowCache
  extend Forwardable

  delegate %i([]) => :hash_cache

  alias_method :fetch, :[]

  private

  def generate_cow(text)
    logger.debug "generating a cow for #{text}"
    `cowsay -f duck #{Shellwords.escape(text)}`
  end

  def hash_cache
    @hash_cache ||= Hash.new do |hash, text|
      hash[text] = generate_cow(text)
    end
  end

  def logger
    @logger ||= Logger.new($stdout).tap do |logger|
      logger.datetime_format = ''
    end
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

  private

  def generate_cow(text)
    logger.debug "generating a cow for #{text}"
    `cowsay -f duck #{Shellwords.escape(text)}`
  end

  def hash_cache
    @hash_cache ||= {}
  end

  def logger
    @logger ||= Logger.new($stdout).tap do |logger|
      logger.datetime_format = ''
    end
  end
end
```


# problem?

* this cache will grow forever
<!-- .element: class="fragment" -->

* if only there was a way to expire it easily…
<!-- .element: class="fragment" -->

* say, on garbage collector runs…
<!-- .element: class="fragment" -->


## enter WeakRef!

```ruby
require 'logger'
require 'shellwords'
require 'weakref'      # (16 yo)

class CowCache
  def fetch(text)
    hash_cache.fetch(text) do
      cow = generate_cow(text)
      hash_cache[text] = WeakRef.new(cow)
    end
  end

  private

  def generate_cow(text)
    logger.debug "generating a cow for #{text}"
    `cowsay -f duck #{Shellwords.escape(text)}`
  end

  def hash_cache
    @hash_cache ||= {}
  end

  def logger
    @logger ||= Logger.new($stdout).tap do |logger|
      logger.datetime_format = ''
    end
  end
end
```


```ruby
cow_cache = CowCache.new
puts cow_cache.fetch('Node.jk')
puts cow_cache.fetch('fck vwls')
puts cow_cache.fetch('Node.jk')
GC.start
puts cow_cache.fetch('fck vwls')
```

```no-highlight
D, [#23422] DEBUG -- : generating a cow for Node.jk
 _________
< Node.jk >
 ---------
 \
  \
   \ >()_
      (__)__ _
D, [#23422] DEBUG -- : generating a cow for fck vwls
 __________
< fck vwls >
 ----------
 \
  \
   \ >()_
      (__)__ _
 _________
< Node.jk >
 ---------
 \
  \
   \ >()_
      (__)__ _
cache.rb:38:in `puts': Invalid Reference - probably recycled (WeakRef::RefError)
	from cache.rb:38:in `puts'
	from cache.rb:38:in `<main>'
```
<!-- .element: class="fragment" -->


```ruby
require 'logger'
require 'shellwords'
require 'weakref'

class CowCache
  def fetch(text)
    if hash_cache.key?(text) && hash_cache[text].weakref_alive?
      hash_cache[text]
    else
      hash_cache[text] = WeakRef.new(generate_cow(text))
    end
  end

  private

  def generate_cow(text)
    logger.debug "generating a cow for #{text}"
    `cowsay -f duck #{Shellwords.escape(text)}`
  end

  def hash_cache
    @hash_cache ||= {}
  end

  def logger
    @logger ||= Logger.new($stdout).tap do |logger|
      logger.datetime_format = ''
    end
  end
end
```


```no-highlight
D, [#23422] DEBUG -- : generating a cow for Node.jk
 _________
< Node.jk >
 ---------
 \
  \
   \ >()_
      (__)__ _
D, [#23422] DEBUG -- : generating a cow for fck vwls
 __________
< fck vwls >
 ----------
 \
  \
   \ >()_
      (__)__ _
 _________
< Node.jk >
 ---------
 \
  \
   \ >()_
      (__)__ _
D, [#23422] DEBUG -- : generating a cow for fck vwls
 __________
< fck vwls >
 ----------
 \
  \
   \ >()_
      (__)__ _
```
