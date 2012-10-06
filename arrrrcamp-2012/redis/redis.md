!SLIDE transition=scrollLeft
# Redis<br />persistence
##  
##  

!SLIDE
# Redis<br />‘persistence’
##  
##  

!SLIDE
# Redis<br />‘persistence’
## (unless you save the data)
##  

!SLIDE
# Redis<br />‘persistence’
## (unless you save the data)
## (consider doing it on a slave)

!SLIDE bullets incremental
# Redis
* fast
* in-memory
* so, fast
* but very simple
* still, so fast!
* [Ohm](http://ohm.keyvalue.org) & [Redis Object Collection](https://github.com/benlund/roc)

!SLIDE
    @@@Ruby
    require 'redis-roc'

















     

!SLIDE
    @@@Ruby
    require 'redis-roc'
    Sig   = Struct.new :author, :text
















     

!SLIDE
    @@@Ruby
    require 'redis-roc'
    Sig   = Struct.new :author, :text
    store = ROC::Store::RedisStore.new Redis.new















     

!SLIDE
    @@@Ruby
    require 'redis-roc'
    Sig   = Struct.new :author, :text
    store = ROC::Store::RedisStore.new Redis.new

                         Sig.new 'Brian P. Hogan',













     

!SLIDE
    @@@Ruby
    require 'redis-roc'
    Sig   = Struct.new :author, :text
    store = ROC::Store::RedisStore.new Redis.new

                         Sig.new 'Brian P. Hogan',
      'There are so many things in Rails that make people go ‘AWESOME’ ' +
      'and then two years later, make them go ‘I should not have used that’.'











     

!SLIDE
    @@@Ruby
    require 'redis-roc'
    Sig   = Struct.new :author, :text
    store = ROC::Store::RedisStore.new Redis.new

    brian = Marshal.dump Sig.new 'Brian P. Hogan',
      'There are so many things in Rails that make people go ‘AWESOME’ ' +
      'and then two years later, make them go ‘I should not have used that’.'











     

!SLIDE
    @@@Ruby
    require 'redis-roc'
    Sig   = Struct.new :author, :text
    store = ROC::Store::RedisStore.new Redis.new

    brian = Marshal.dump Sig.new 'Brian P. Hogan',
      'There are so many things in Rails that make people go ‘AWESOME’ ' +
      'and then two years later, make them go ‘I should not have used that’.'
    store.init_set('tag:Ruby').add brian










     

!SLIDE
    @@@Ruby
    require 'redis-roc'
    Sig   = Struct.new :author, :text
    store = ROC::Store::RedisStore.new Redis.new

    brian = Marshal.dump Sig.new 'Brian P. Hogan',
      'There are so many things in Rails that make people go ‘AWESOME’ ' +
      'and then two years later, make them go ‘I should not have used that’.'
    store.init_set('tag:Ruby').add brian

    reg = Marshal.dump Sig.new 'Reg Braithwaite',
      'The ‘Ruby Community’ is the Woody Allen of programming languages, ' +
      'all neuroses and internal monologues, but loveable and means well.'






     

!SLIDE
    @@@Ruby
    require 'redis-roc'
    Sig   = Struct.new :author, :text
    store = ROC::Store::RedisStore.new Redis.new

    brian = Marshal.dump Sig.new 'Brian P. Hogan',
      'There are so many things in Rails that make people go ‘AWESOME’ ' +
      'and then two years later, make them go ‘I should not have used that’.'
    store.init_set('tag:Ruby').add brian

    reg = Marshal.dump Sig.new 'Reg Braithwaite',
      'The ‘Ruby Community’ is the Woody Allen of programming languages, ' +
      'all neuroses and internal monologues, but loveable and means well.'
    store.init_set('tag:Ruby').add   reg
    store.init_set('tag:movies').add reg




     

!SLIDE
    @@@Ruby
    require 'redis-roc'
    Sig   = Struct.new :author, :text
    store = ROC::Store::RedisStore.new Redis.new

    brian = Marshal.dump Sig.new 'Brian P. Hogan',
      'There are so many things in Rails that make people go ‘AWESOME’ ' +
      'and then two years later, make them go ‘I should not have used that’.'
    store.init_set('tag:Ruby').add brian

    reg = Marshal.dump Sig.new 'Reg Braithwaite',
      'The ‘Ruby Community’ is the Woody Allen of programming languages, ' +
      'all neuroses and internal monologues, but loveable and means well.'
    store.init_set('tag:Ruby').add   reg
    store.init_set('tag:movies').add reg

    adam = Marshal.dump Sig.new 'Adam Keys',
      'I want to see a hacker movie where the protagonist just stares in ' +
      'confusion at a stack trace for a few minutes. No typing, no chatter.'
     

!SLIDE
    @@@Ruby
    require 'redis-roc'
    Sig   = Struct.new :author, :text
    store = ROC::Store::RedisStore.new Redis.new

    brian = Marshal.dump Sig.new 'Brian P. Hogan',
      'There are so many things in Rails that make people go ‘AWESOME’ ' +
      'and then two years later, make them go ‘I should not have used that’.'
    store.init_set('tag:Ruby').add brian

    reg = Marshal.dump Sig.new 'Reg Braithwaite',
      'The ‘Ruby Community’ is the Woody Allen of programming languages, ' +
      'all neuroses and internal monologues, but loveable and means well.'
    store.init_set('tag:Ruby').add   reg
    store.init_set('tag:movies').add reg

    adam = Marshal.dump Sig.new 'Adam Keys',
      'I want to see a hacker movie where the protagonist just stares in ' +
      'confusion at a stack trace for a few minutes. No typing, no chatter.'
    store.init_set('tag:movies').add adam

!SLIDE
    @@@Ruby
    ruby   = store.init_set 'tag:Ruby'
    movies = store.init_set 'tag:movies'







     

!SLIDE
    @@@Ruby
    ruby   = store.init_set 'tag:Ruby'
    movies = store.init_set 'tag:movies'

    sig = Marshal.load (ruby & movies).sample





     

!SLIDE
    @@@Ruby
    ruby   = store.init_set 'tag:Ruby'
    movies = store.init_set 'tag:movies'

    sig = Marshal.load (ruby & movies).sample
    puts sig.text
    puts '— ' + sig.author



     

!SLIDE
    @@@Ruby
    ruby   = store.init_set 'tag:Ruby'
    movies = store.init_set 'tag:movies'

    sig = Marshal.load (ruby & movies).sample
    puts sig.text
    puts '— ' + sig.author

    # The ‘Ruby Community’ is the Woody Allen of programming languages,
    # all neuroses and internal monologues, but loveable and means well.
    # — Reg Braithwaite
