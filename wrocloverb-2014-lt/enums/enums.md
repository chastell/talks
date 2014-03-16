!SLIDE transition=scrollLeft
    @@@ Ruby
    wroclove = Date.new 2014, 3, 16
    eurucamp = Date.new 2014, 8,  1

    (wroclove..eurucamp).all?(&:friday?)
     

!SLIDE
    @@@ Ruby
    wroclove = Date.new 2014, 3, 16
    eurucamp = Date.new 2014, 8,  1

    (wroclove..eurucamp).all?(&:friday?)
    #=> false :(

!SLIDE
    @@@ Ruby
    wroclove = Date.new 2014, 3, 16
    eurucamp = Date.new 2014, 8,  1

    (wroclove..eurucamp).count(&:friday?)
     

!SLIDE
    @@@ Ruby
    wroclove = Date.new 2014, 3, 16
    eurucamp = Date.new 2014, 8,  1

    (wroclove..eurucamp).count(&:friday?)
    #=> 20 \o/

!SLIDE
    @@@ Ruby
    wroclove = Date.new 2014, 3, 16
    eurucamp = Date.new 2014, 8,  1

    (wroclove..eurucamp).select(&:friday?)
     

!SLIDE
    @@@ Ruby
    wroclove = Date.new 2014, 3, 16
    eurucamp = Date.new 2014, 8,  1

    (wroclove..eurucamp).select(&:friday?)
    #=> March 21st, March 28th, April 4th…

!SLIDE transition=scrollLeft
    @@@ Ruby
    wroclove = Date.new 2014, 3, 16
    eurucamp = Date.new 2014, 8,  1

    (wroclove..eurucamp).each_cons(2) do |lower, upper|

    end





     

!SLIDE
    @@@ Ruby
    wroclove = Date.new 2014, 3, 16
    eurucamp = Date.new 2014, 8,  1

    (wroclove..eurucamp).each_cons(2) do |lower, upper|
      puts "#{lower} - #{upper}"
    end





     

!SLIDE
    @@@ Ruby
    wroclove = Date.new 2014, 3, 16
    eurucamp = Date.new 2014, 8,  1

    (wroclove..eurucamp).each_cons(2) do |lower, upper|
      puts "#{lower} - #{upper}"
    end
    # 2014-03-16 - 2014-03-17
    # 2014-03-17 - 2014-03-18
    # 2014-03-18 - 2014-03-19
    # …

     

!SLIDE transition=scrollLeft
    @@@ Ruby
    wroclove = Date.new 2014, 3, 16
    eurucamp = Date.new 2014, 8,  1

                       (wroclove..eurucamp).partition do |date|

    end





     

!SLIDE
    @@@ Ruby
    wroclove = Date.new 2014, 3, 16
    eurucamp = Date.new 2014, 8,  1

                       (wroclove..eurucamp).partition do |date|
      date.saturday? or date.sunday?
    end





     

!SLIDE
    @@@ Ruby
    wroclove = Date.new 2014, 3, 16
    eurucamp = Date.new 2014, 8,  1

    weekend, weekday = (wroclove..eurucamp).partition do |date|
      date.saturday? or date.sunday?
    end





     

!SLIDE
    @@@ Ruby
    wroclove = Date.new 2014, 3, 16
    eurucamp = Date.new 2014, 8,  1

    weekend, weekday = (wroclove..eurucamp).partition do |date|
      date.saturday? or date.sunday?
    end

    weekend
    #=> March 16th, March 22nd, March 23rd…


     

!SLIDE
    @@@ Ruby
    wroclove = Date.new 2014, 3, 16
    eurucamp = Date.new 2014, 8,  1

    weekend, weekday = (wroclove..eurucamp).partition do |date|
      date.saturday? or date.sunday?
    end

    weekend
    #=> March 16th, March 22nd, March 23rd…

    weekday
    #=> the rest :(

!SLIDE transition=scrollLeft
    @@@ Ruby
    wroclove = Date.new 2014, 3, 16
    eurucamp = Date.new 2014, 8,  1

    (wroclove..eurucamp).slice_before(&:monday?)





     

!SLIDE
    @@@ Ruby
    wroclove = Date.new 2014, 3, 16
    eurucamp = Date.new 2014, 8,  1

    (wroclove..eurucamp).slice_before(&:monday?).each do |week|

    end



     

!SLIDE
    @@@ Ruby
    wroclove = Date.new 2014, 3, 16
    eurucamp = Date.new 2014, 8,  1

    (wroclove..eurucamp).slice_before(&:monday?).each do |week|
      puts "#{week.first} – #{week.last}"
    end



     

!SLIDE
    @@@ Ruby
    wroclove = Date.new 2014, 3, 16
    eurucamp = Date.new 2014, 8,  1

    (wroclove..eurucamp).slice_before(&:monday?).each do |week|
      puts "#{week.first} – #{week.last}"
    end
    # 2014-03-16 – 2014-03-16 ← last day of this week
    # 2014-03-17 – 2014-03-23
    # 2014-03-24 – 2014-03-30
    # …

!SLIDE transition=scrollLeft
    @@@ Ruby
    class Date
      def free?
        saturday? or sunday?
      end
    end

!SLIDE transition=scrollLeft
    @@@ Ruby
    fun   = %w(⚓ ⚛ ♥ ♫ ⚘ ✍ ✂ ⚔)












     

!SLIDE
    @@@ Ruby
    fun   = %w(⚓ ⚛ ♥ ♫ ⚘ ✍ ✂ ⚔)
    plans = -> free { free ? fun.sample : '⚒' }











     

!SLIDE
    @@@ Ruby
    fun   = %w(⚓ ⚛ ♥ ♫ ⚘ ✍ ✂ ⚔)
    plans = -> free { free ? fun.sample : '⚒' }

    (wroclove..eurucamp).chunk(&:free?).each do |free, dates|

    end







     

!SLIDE
    @@@ Ruby
    fun   = %w(⚓ ⚛ ♥ ♫ ⚘ ✍ ✂ ⚔)
    plans = -> free { free ? fun.sample : '⚒' }

    (wroclove..eurucamp).chunk(&:free?).each do |free, dates|
      puts dates.map { plans.(free) }.join ' '
    end







     

!SLIDE
    @@@ Ruby
    fun   = %w(⚓ ⚛ ♥ ♫ ⚘ ✍ ✂ ⚔)
    plans = -> free { free ? fun.sample : '⚒' }

    (wroclove..eurucamp).chunk(&:free?).each do |free, dates|
      puts dates.map { plans.(free) }.join ' '
    end
    # ⚛






     

!SLIDE
    @@@ Ruby
    fun   = %w(⚓ ⚛ ♥ ♫ ⚘ ✍ ✂ ⚔)
    plans = -> free { free ? fun.sample : '⚒' }

    (wroclove..eurucamp).chunk(&:free?).each do |free, dates|
      puts dates.map { plans.(free) }.join ' '
    end
    # ⚛
    # ⚒ ⚒ ⚒ ⚒ ⚒





     

!SLIDE
    @@@ Ruby
    fun   = %w(⚓ ⚛ ♥ ♫ ⚘ ✍ ✂ ⚔)
    plans = -> free { free ? fun.sample : '⚒' }

    (wroclove..eurucamp).chunk(&:free?).each do |free, dates|
      puts dates.map { plans.(free) }.join ' '
    end
    # ⚛
    # ⚒ ⚒ ⚒ ⚒ ⚒
    # ⚘ ⚔
    # ⚒ ⚒ ⚒ ⚒ ⚒
    # ♫ ⚓
    # ⚒ ⚒ ⚒ ⚒ ⚒
    # ✂ ♥
    # …
