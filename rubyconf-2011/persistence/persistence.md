!SLIDE bullets incremental transition=scrollLeft
# where do we persist?
* in databases, silly!

!SLIDE incremental
# \o/   yay for databases!   \o/
* <div class='quote'>A database is a black hole into which you put your data. If you’re lucky, you’ll get it back again. If you’re very lucky, you’ll get it back in a form you can use.<br />— Charlie Gibbs</div>
* <div class='quote'>I should like to find the person who decided that since ‘bookmarks’ and ‘history’ were both lists of URLs they ought to be integrated in a single database. I should like to shake him warmly by the throat until his head comes off.<br />— Roger Burton West on Firefox, [hates-software](http://hates-software.com)</div>

!SLIDE bullets incremental
# where do we persist?
* MySQL!

!SLIDE incremental
# \o/   yay for MySQL!   \o/
* <div class='quote'>MySQL is truly the PHP of the database world.<br />— Will Jessop</div>
* <div class='quote'>‘It looks like you’re creating a database. Most likely<br />you’d like it in Latin1 encoding with Swedish collation.’<br />No, MySQL, no, I wouldn’t.<br />— James Higgs</div>

!SLIDE center incremental transition=scrollRight
![zebras](zebras.jpg)
[Edible Dirt](http://eddirt.frozenreality.co.uk/?id=550)

!SLIDE bullets incremental transition=scrollLeft
# persisting objects<br />in relational databases
* MySQL, PostgreSQL, SQLite | [embedded](https://github.com/copiousfreetime/amalgalite)?
* serialise properties to database types
* PostgreSQL: geometric, arrays, your own
* table, row, column

!SLIDE incremental
# um, yay for NoSQL, then?
* <div class='quote'>Database research has produced a number of good results, but the relational database is not one of them.<br />— Henry G. Baker</div>
* <div class='quote'>Dear everyone reinventing SQL-the-query-language on top of NoSQL databases: just what in the fuck is wrong with you?<br />— Ian Eure</div>

!SLIDE bullets incremental
# persisting objects<br />in document databases
* CouchDB, MongoDB | [embedded](https://github.com/gdb/embedded-mongo)?
* serialise properties to database types
* arrays, hashes, nested documents
* collection, document, field

!SLIDE bullets incremental
# persisting objects<br />elsewhere
* in memory: Redis | [ROC](https://github.com/benlund/roc)!
* graph databases: Neo4j
* directory services: LDAP
* how about [YAML Record](https://github.com/Nico-Taing/yaml_record) or PStore?

!SLIDE transition=scrollLeft
## PStore: stdlib’s persistence

    @@@Ruby
    # it’s in the standard library
    # and has Marshal and YAML backends

    require 'yaml/store'
    store = YAML::Store.new 'quotes.yml'
     
     
     
     
     
     
     
     
     

!SLIDE
## PStore: it’s transactional!

    @@@Ruby
    # quotes are author + text structures
    Quote = Struct.new(:author, :text)

    store.transaction do   # a read/write transaction…

      store['db'] ||= []

      store['db'] << Quote.new('Charlie Gibbs',
        'A database is a black hole into which you put your data.')

      store['db'] << Quote.new('Will Jessop',
        'MySQL is truly the PHP of the database world.')

    end                    # …is atomically committed here

!SLIDE
## PStore: it’s transactional!

    @@@Ruby
    # read-only transactions can be concurrent
    # and raise when you try to write anything

    store.transaction(true) do

      store['db'].each do |quote|

        puts quote.text
        puts '-- ' + quote.author
        puts

      end

    end

!SLIDE commandline incremental
## YAML::PStore: it’s readable!

    $ ruby quotes.rb
    A database is a black hole into which you put your data.
    -- Charlie Gibbs

    MySQL is truly the PHP of the database world.
    -- Will Jessop


    $ cat quotes.yml
    ---
    db:
    - !ruby/struct:Quote
      author: Charlie Gibbs
      text: A database is a black hole into which you put your data.
    - !ruby/struct:Quote
      author: Will Jessop
      text: MySQL is truly the PHP of the database world.

!SLIDE center transition=scrollRight
![DEATH TO HIPSTERS](hipsters.jpg)
[Made in Hell: Photo of the Day: Death to hipsters](http://bloginhell.tumblr.com/post/10099892090/made-in-hell-photo-of-the-day-death-to-hipsters)
