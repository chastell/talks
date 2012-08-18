!SLIDE bullets incremental transition=scrollLeft
# going way overboard (?)
* it’s all about objects
* why not hide persistance altogether?
* [Candy](https://github.com/SFEley/candy)

!SLIDE transition=scrollLeft
## Candy: transparent persistence in MongoDB
    @@@ Ruby
    require 'candy'













     

!SLIDE
## Candy: transparent persistence in MongoDB
    @@@ Ruby
    require 'candy'

    class Conference
      include Candy::Piece
    end









     

!SLIDE
## Candy: transparent persistence in MongoDB
    @@@ Ruby
    require 'candy'

    class Conference
      include Candy::Piece
    end

    src = Conference.new
    # connects to localhost:27017 and ‘chastell’ db if needed
    # and saves a new document to the ‘Conference’ collection





     

!SLIDE
## Candy: transparent persistence in MongoDB
    @@@ Ruby
    require 'candy'

    class Conference
      include Candy::Piece
    end

    src = Conference.new
    # connects to localhost:27017 and ‘chastell’ db if needed
    # and saves a new document to the ‘Conference’ collection

    src.location = 'Edinburgh'   # method_missing resaves



     

!SLIDE
## Candy: transparent persistence in MongoDB
    @@@ Ruby
    require 'candy'

    class Conference
      include Candy::Piece
    end

    src = Conference.new
    # connects to localhost:27017 and ‘chastell’ db if needed
    # and saves a new document to the ‘Conference’ collection

    src.location = 'Edinburgh'   # method_missing resaves

    src.events = { parties: { saturday: 'Zoë Keating concert' } }
    src.events.parties.saturday    #=> 'Zoë Keating concert'
     

!SLIDE center transition=scrollRight
![cops](cops.jpg)
[*THE* Random Picture Thread](http://tdpri.com/forum/2602851-post1573.html)
