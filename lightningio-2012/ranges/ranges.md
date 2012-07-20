!SLIDE transition=scrollLeft
    @@@ Ruby
    lightning = Date.new 2012, 7, 21
    eurucamp  = Date.new 2012, 8, 17





     

!SLIDE
    @@@ Ruby
    lightning = Date.new 2012, 7, 21
    eurucamp  = Date.new 2012, 8, 17

    eurucamp - lightning



     

!SLIDE
    @@@ Ruby
    lightning = Date.new 2012, 7, 21
    eurucamp  = Date.new 2012, 8, 17

    eurucamp - lightning
    #=> 27 days


     

!SLIDE
    @@@ Ruby
    lightning = Date.new 2012, 7, 21
    eurucamp  = Date.new 2012, 8, 17

    eurucamp - lightning
    #=> 27 days

    lightning..eurucamp
    #=> Range of Dates

!SLIDE transition=scrollLeft
    @@@ Ruby
    lightning = Date.new 2012, 7, 21
    eurucamp  = Date.new 2012, 8, 17

    case Date.today



    end
     

!SLIDE
    @@@ Ruby
    lightning = Date.new 2012, 7, 21
    eurucamp  = Date.new 2012, 8, 17

    case Date.today
    when Date.new...lightning     then :before


    end
     

!SLIDE
    @@@ Ruby
    lightning = Date.new 2012, 7, 21
    eurucamp  = Date.new 2012, 8, 17

    case Date.today
    when Date.new...lightning     then :before
    when lightning...eurucamp     then :between

    end
     

!SLIDE
    @@@ Ruby
    lightning = Date.new 2012, 7, 21
    eurucamp  = Date.new 2012, 8, 17

    case Date.today
    when Date.new...lightning     then :before
    when lightning...eurucamp     then :between
    when eurucamp..Date::Infinity then :after
    end
     

!SLIDE
    @@@ Ruby
    lightning = Date.new 2012, 7, 21
    eurucamp  = Date.new 2012, 8, 17

    case Date.today
    when Date.new...lightning     then :before
    when lightning...eurucamp     then :between
    when eurucamp..Date::Infinity then :after
    end
    #=> :between
