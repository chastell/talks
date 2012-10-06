!SLIDE bullets incremental transition=scrollLeft
# PStore
* it’s in the standard library
* it saves everything to flat files
* defaults to a Marshal backend
* but can use a YAML backend
* (there’s [YAML::Record](https://github.com/Nico-Taing/yaml_record) if AR is your thing)

!SLIDE
    @@@Ruby
    require 'yaml/store'
    store = YAML::Store.new 'sigs.yml'













     

!SLIDE
    @@@Ruby
    require 'yaml/store'
    store = YAML::Store.new 'sigs.yml'

    Sig = Struct.new :author, :tags, :text











     

!SLIDE
    @@@Ruby
    require 'yaml/store'
    store = YAML::Store.new 'sigs.yml'

    Sig = Struct.new :author, :tags, :text

    store.transaction do









    end

!SLIDE
    @@@Ruby
    require 'yaml/store'
    store = YAML::Store.new 'sigs.yml'

    Sig = Struct.new :author, :tags, :text

    store.transaction do
      store['db'] ||= []








    end

!SLIDE
    @@@Ruby
    require 'yaml/store'
    store = YAML::Store.new 'sigs.yml'

    Sig = Struct.new :author, :tags, :text

    store.transaction do
      store['db'] ||= []

                       Sig.new 'Mike Perham', ['Ruby', 'Rails'],
        '‘Never wrestle with a pig – you get dirty and the ' +
        'pig likes it.’ NOW REPLACE PIG WITH ASSET PIPELINE.'




    end

!SLIDE
    @@@Ruby
    require 'yaml/store'
    store = YAML::Store.new 'sigs.yml'

    Sig = Struct.new :author, :tags, :text

    store.transaction do
      store['db'] ||= []

      store['db'].push Sig.new 'Mike Perham', ['Ruby', 'Rails'],
        '‘Never wrestle with a pig – you get dirty and the ' +
        'pig likes it.’ NOW REPLACE PIG WITH ASSET PIPELINE.'




    end

!SLIDE
    @@@Ruby
    require 'yaml/store'
    store = YAML::Store.new 'sigs.yml'

    Sig = Struct.new :author, :tags, :text

    store.transaction do
      store['db'] ||= []

      store['db'].push Sig.new 'Mike Perham', ['Ruby', 'Rails'],
        '‘Never wrestle with a pig – you get dirty and the ' +
        'pig likes it.’ NOW REPLACE PIG WITH ASSET PIPELINE.'

      store['db'].push Sig.new 'Solomon White', ['Ruby', 'RubyGems'],
        'If you’re ever tempted to add a post-install message ' +
        'to a gem, stop and back slowly away from the keyboard.'
    end

!SLIDE
    @@@Ruby
    require 'yaml/store'
    store = YAML::Store.new 'sigs.yml'

    Sig = Struct.new :author, :tags, :text

    store.transaction do   # read-write transaction…
      store['db'] ||= []

      store['db'].push Sig.new 'Mike Perham', ['Ruby', 'Rails'],
        '‘Never wrestle with a pig – you get dirty and the ' +
        'pig likes it.’ NOW REPLACE PIG WITH ASSET PIPELINE.'

      store['db'].push Sig.new 'Solomon White', ['Ruby', 'RubyGems'],
        'If you’re ever tempted to add a post-install message ' +
        'to a gem, stop and back slowly away from the keyboard.'
    end   # …atomically written here

!SLIDE
    @@@Ruby
          store.transaction true do   # read-only transaction

    end






     

!SLIDE
    @@@Ruby
          store.transaction true do   # read-only transaction
      store['db'].select { |sig| sig.tags.include? 'Ruby' }.sample
    end






     

!SLIDE
    @@@Ruby
    sig = store.transaction true do   # read-only transaction
      store['db'].select { |sig| sig.tags.include? 'Ruby' }.sample
    end






     

!SLIDE
    @@@Ruby
    sig = store.transaction true do   # read-only transaction
      store['db'].select { |sig| sig.tags.include? 'Ruby' }.sample
    end

    puts sig.text
    puts '— ' + sig.author



     

!SLIDE
    @@@Ruby
    sig = store.transaction true do   # read-only transaction
      store['db'].select { |sig| sig.tags.include? 'Ruby' }.sample
    end

    puts sig.text
    puts '— ' + sig.author

    # ‘Never wrestle with a pig – you get dirty and the
    # pig likes it.’ NOW REPLACE PIG WITH ASSET PIPELINE.
    # — Mike Perham

!SLIDE commandline incremental
## it’s YAML
    $ cat sigs.yml
    ---
    db:
    - !ruby/struct:Sig
      author: Mike Perham
      tags:
      - Ruby
      - Rails
      text: ‘Never wrestle with a pig – you get dirty and the
        pig likes it.’ NOW REPLACE PIG WITH ASSET PIPELINE.
    - !ruby/struct:Sig
      author: Solomon White
      tags:
      - Ruby
      - RubyGems
      text: If you’re ever tempted to add a post-install message
        to a gem, stop and back slowly away from the keyboard.
