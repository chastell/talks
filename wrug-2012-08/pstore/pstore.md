!SLIDE transition=scrollLeft
# PStore
    @@@Ruby
    # it’s in the standard library
    # and has Marshal and YAML backends

    require 'yaml/store'
    store = YAML::Store.new 'sigs.yml'

!SLIDE transition=scrollLeft
    @@@Ruby
    # sigs are author + text structures
    Sig = Struct.new(:author, :text)













     

!SLIDE
    @@@Ruby
    # sigs are author + text structures
    Sig = Struct.new(:author, :text)

    store.transaction do

      store['db'] ||= []









    end

!SLIDE
    @@@Ruby
    # sigs are author + text structures
    Sig = Struct.new(:author, :text)

    store.transaction do

      store['db'] ||= []

      store['db'] << Sig.new('Tim Pope',
        'I wonder if the guy that wrote BigDecimal#inspect has ' +
        'a tragic backstory that explains why he hates humanity.')





    end

!SLIDE
    @@@Ruby
    # sigs are author + text structures
    Sig = Struct.new(:author, :text)

    store.transaction do   # a read/write transaction…

      store['db'] ||= []

      store['db'] << Sig.new('Tim Pope',
        'I wonder if the guy that wrote BigDecimal#inspect has ' +
        'a tragic backstory that explains why he hates humanity.')

      store['db'] << Sig.new('Pаul Bаttley',
        'I’d love to see an honest Ruby job ad. ‘You will spend half ' +
        'your time running bundle install & the other half facepalming.’')

    end                    # …is atomically committed here

!SLIDE transition=scrollLeft
    @@@Ruby
    # read-only transactions can be concurrent
    # and raise when you try to write anything

    store.transaction(true) do

      store['db'].each do |sig|

        puts sig.text
        puts '-- ' + sig.author
        puts

      end

    end

!SLIDE commandline incremental
    $ ruby sigs.rb
    I wonder if the guy that wrote BigDecimal#inspect has
    a tragic backstory that explains why he hates humanity.
    -- Tim Pope

    I’d love to see an honest Ruby job ad. ‘You will spend half
    your time running bundle install & the other half facepalming.’
    -- Pаul Bаttley

    $ cat sigs.yml
    ---
    db:
    - !ruby/struct:Sig
      author: Tim Pope
      text: I wonder if the guy that wrote BigDecimal#inspect
        has a tragic backstory that explains why he hates humanity.
    - !ruby/struct:Sig
      author: Pаul Bаttley
      text: I’d love to see an honest Ruby job ad. ‘You will spend half
        your time running bundle install & the other half facepalming.’
