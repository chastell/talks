!SLIDE bullets incremental transition=scrollLeft
# but how do we<br />_actually_ persist?
* Active Record, DataMapper
* Mongoid, MongoMapper
* ARel
* how about some [Candy](https://github.com/SFEley/candy) and [Ambition](http://defunkt.io/ambition)?

!SLIDE
## Candy: transparent persistence in MongoDB

    @@@Ruby
    require 'candy'

    class Conference
      include Candy::Piece
    end

    rubyconf = Conference.new
    # connects to localhost:27017 and ‘chastell’ db if needed
    # and saves a new document to the ‘Conference’ collection

    rubyconf.location = 'New Orleans'   # method_missing resaves

    rubyconf.events = { parties: { thursday: '&block Party' } }
    rubyconf.events.parties.thursday    #=> '&block Party'
     

!SLIDE
## Ambition: persistence queries in Ruby

    @@@Ruby
    require 'ambition/adapters/active_record'

    class Person < ActiveRecord::Base
    end

    Person.select do |p|
      (p.country == 'USA' && p.age >= 21) ||
      (p.country != 'USA' && p.age >= 18)
    end

    # SELECT * FROM people
    # WHERE (
    #   (people.country =  'USA' AND people.age >= 21) OR
    #   (people.country <> 'USA' AND people.age >= 18)
    # )

!SLIDE
## Ambition: persistence queries in Ruby

    @@@Ruby
    require 'ambition/adapters/active_ldap'

    class Person < ActiveLdap::Base
    end

    Person.select do |p|
      (p.country == 'USA' && p.age >= 21) ||
      (p.country != 'USA' && p.age >= 18)
    end

    # (|
    #   (& (country=USA)    (age>=21) )
    #   (& (!(country=USA)) (age>=18) )
    # )
     

!SLIDE center transition=scrollRight
![abracadabra](abracadabra.gif)
[channelATE: Balloon magic](http://www.channelate.com/2010/07/15/balloon-magic)

!SLIDE incremental transition=scrollLeft
# consider disassociating<br />your models from your db
* <div class='quote'>We need something better. Persistance and logic are two separate responsibilities that every Rails app combines.<br />— Steve Klabnik</div>
* <div class='quote'>When I open up a Rails project and the models dir is full of 100% ActiveRecord classes I shudder. Model ≠ Persistence.<br />— Ben Mabey</div>
* [Object Oriented Programming in Rails](http://rubyrogues.com/object-oriented-programming-in-rails-with-jim-weirich)
