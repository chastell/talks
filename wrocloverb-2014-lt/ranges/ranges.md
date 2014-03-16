!SLIDE transition=scrollLeft
    @@@ Ruby
    wroclove = Date.new 2014, 3, 16
    eurucamp = Date.new 2014, 8,  1





     

!SLIDE
    @@@ Ruby
    wroclove = Date.new 2014, 3, 16
    eurucamp = Date.new 2014, 8,  1

    eurucamp - wroclove



     

!SLIDE
    @@@ Ruby
    wroclove = Date.new 2014, 3, 16
    eurucamp = Date.new 2014, 8,  1

    eurucamp - wroclove
    #=> 138 days


     

!SLIDE
    @@@ Ruby
    wroclove = Date.new 2014, 3, 16
    eurucamp = Date.new 2014, 8,  1

    eurucamp - wroclove
    #=> 138 days

    wroclove..eurucamp
    #=> Range of Dates

!SLIDE transition=scrollLeft
    @@@ Ruby
    wroclove = Date.new 2014, 3, 16
    eurucamp = Date.new 2014, 8,  1

    case Date.today



    end
     

!SLIDE
    @@@ Ruby
    wroclove = Date.new 2014, 3, 16
    eurucamp = Date.new 2014, 8,  1

    case Date.today
    when Date.new...wroclove      then :before


    end
     

!SLIDE
    @@@ Ruby
    wroclove = Date.new 2014, 3, 16
    eurucamp = Date.new 2014, 8,  1

    case Date.today
    when Date.new...wroclove      then :before
    when wroclove...eurucamp      then :between

    end
     

!SLIDE
    @@@ Ruby
    wroclove = Date.new 2014, 3, 16
    eurucamp = Date.new 2014, 8,  1

    case Date.today
    when Date.new...wroclove      then :before
    when wroclove...eurucamp      then :between
    when eurucamp..Date::Infinity then :after
    end
     

!SLIDE
    @@@ Ruby
    wroclove = Date.new 2014, 3, 16
    eurucamp = Date.new 2014, 8,  1

    case Date.today
    when Date.new...wroclove      then :before
    when wroclove...eurucamp      then :between
    when eurucamp..Date::Infinity then :after
    end
    #=> :between
