!SLIDE transition=scrollLeft
    @@@ Ruby
    lightning = Date.new 2012, 7, 21
    eurucamp  = Date.new 2012, 8, 17

    (lightning..eurucamp).each do |date|

    end



     

!SLIDE
    @@@ Ruby
    lightning = Date.new 2012, 7, 21
    eurucamp  = Date.new 2012, 8, 17

    (lightning..eurucamp).each do |date|
      puts date
    end



     

!SLIDE
    @@@ Ruby
    lightning = Date.new 2012, 7, 21
    eurucamp  = Date.new 2012, 8, 17

    (lightning..eurucamp).each do |date|
      puts date
    end
    # 2012-07-21
    # 2012-07-22
    # 2012-07-23
    # …

!SLIDE transition=scrollLeft
    @@@ Ruby
    lightning = Date.new 2012, 7, 21
    eurucamp  = Date.new 2012, 8, 17

    (lightning..eurucamp).all? &:friday?
     

!SLIDE
    @@@ Ruby
    lightning = Date.new 2012, 7, 21
    eurucamp  = Date.new 2012, 8, 17

    (lightning..eurucamp).all? &:friday?
    #=> false :(

!SLIDE
    @@@ Ruby
    lightning = Date.new 2012, 7, 21
    eurucamp  = Date.new 2012, 8, 17

    (lightning..eurucamp).count &:friday?
     

!SLIDE
    @@@ Ruby
    lightning = Date.new 2012, 7, 21
    eurucamp  = Date.new 2012, 8, 17

    (lightning..eurucamp).count &:friday?
    #=> 4 \o/

!SLIDE
    @@@ Ruby
    lightning = Date.new 2012, 7, 21
    eurucamp  = Date.new 2012, 8, 17

    (lightning..eurucamp).select &:friday?
     

!SLIDE
    @@@ Ruby
    lightning = Date.new 2012, 7, 21
    eurucamp  = Date.new 2012, 8, 17

    (lightning..eurucamp).select &:friday?
    #=> July 27th, August 3rd, August 10th, August 17th

!SLIDE transition=scrollLeft
    @@@ Ruby
    lightning = Date.new 2012, 7, 21
    eurucamp  = Date.new 2012, 8, 17

    (lightning..eurucamp).each_cons(2) do |lower, upper|

    end






     

!SLIDE
    @@@ Ruby
    lightning = Date.new 2012, 7, 21
    eurucamp  = Date.new 2012, 8, 17

    (lightning..eurucamp).each_cons(2) do |lower, upper|
      puts "#{lower} - #{upper}"
    end






     

!SLIDE
    @@@ Ruby
    lightning = Date.new 2012, 7, 21
    eurucamp  = Date.new 2012, 8, 17

    (lightning..eurucamp).each_cons(2) do |lower, upper|
      puts "#{lower} - #{upper}"
    end
    # 2012-07-21 - 2012-07-22
    # 2012-07-22 - 2012-07-23
    # 2012-07-23 - 2012-07-24
    # 2012-07-24 - 2012-07-25
    # 2012-07-25 - 2012-07-26
    # 2012-07-26 - 2012-07-27
    # 2012-07-27 - 2012-07-28

!SLIDE transition=scrollLeft
    @@@ Ruby
    lightning = Date.new 2012, 7, 21
    eurucamp  = Date.new 2012, 8, 17

                       (lightning..eurucamp).partition do |date|

    end






     

!SLIDE
    @@@ Ruby
    lightning = Date.new 2012, 7, 21
    eurucamp  = Date.new 2012, 8, 17

                       (lightning..eurucamp).partition do |date|
      date.saturday? or date.sunday?
    end






     

!SLIDE
    @@@ Ruby
    lightning = Date.new 2012, 7, 21
    eurucamp  = Date.new 2012, 8, 17

    weekend, weekday = (lightning..eurucamp).partition do |date|
      date.saturday? or date.sunday?
    end






     

!SLIDE
    @@@ Ruby
    lightning = Date.new 2012, 7, 21
    eurucamp  = Date.new 2012, 8, 17

    weekend, weekday = (lightning..eurucamp).partition do |date|
      date.saturday? or date.sunday?
    end

    weekend
    #=> July 21st, July 22nd, July 28th, July 29th,
    #   August 4th, August 5th, August 11th, August 12th


     

!SLIDE
    @@@ Ruby
    lightning = Date.new 2012, 7, 21
    eurucamp  = Date.new 2012, 8, 17

    weekend, weekday = (lightning..eurucamp).partition do |date|
      date.saturday? or date.sunday?
    end

    weekend
    #=> July 21st, July 22nd, July 28th, July 29th,
    #   August 4th, August 5th, August 11th, August 12th

    weekday
    #=> the rest :(

!SLIDE transition=scrollLeft
    @@@ Ruby
    class Date
      def free?
        saturday? or sunday? or (month == 8 and day == 15)
      end
    end

!SLIDE transition=scrollLeft
    @@@ Ruby
    fun   = %w(✈ ⚓ ⚛ ♥ ♫ ⚘ ✍ ✂ ⚔)














     

!SLIDE
    @@@ Ruby
    fun   = %w(✈ ⚓ ⚛ ♥ ♫ ⚘ ✍ ✂ ⚔)
    plans = ->(free) { free ? fun.sample : '⚒' }













     

!SLIDE
    @@@ Ruby
    fun   = %w(✈ ⚓ ⚛ ♥ ♫ ⚘ ✍ ✂ ⚔)
    plans = ->(free) { free ? fun.sample : '⚒' }

    (lightning..eurucamp).chunk(&:free?).each do |free, dates|

    end









     

!SLIDE
    @@@ Ruby
    fun   = %w(✈ ⚓ ⚛ ♥ ♫ ⚘ ✍ ✂ ⚔)
    plans = ->(free) { free ? fun.sample : '⚒' }

    (lightning..eurucamp).chunk(&:free?).each do |free, dates|
      puts dates.map { plans.(free) }.join ' '
    end









     

!SLIDE
    @@@ Ruby
    fun   = %w(✈ ⚓ ⚛ ♥ ♫ ⚘ ✍ ✂ ⚔)
    plans = ->(free) { free ? fun.sample : '⚒' }

    (lightning..eurucamp).chunk(&:free?).each do |free, dates|
      puts dates.map { plans.(free) }.join ' '
    end
    # ⚛ ✈








     

!SLIDE
    @@@ Ruby
    fun   = %w(✈ ⚓ ⚛ ♥ ♫ ⚘ ✍ ✂ ⚔)
    plans = ->(free) { free ? fun.sample : '⚒' }

    (lightning..eurucamp).chunk(&:free?).each do |free, dates|
      puts dates.map { plans.(free) }.join ' '
    end
    # ⚛ ✈
    # ⚒ ⚒ ⚒ ⚒ ⚒







     

!SLIDE
    @@@ Ruby
    fun   = %w(✈ ⚓ ⚛ ♥ ♫ ⚘ ✍ ✂ ⚔)
    plans = ->(free) { free ? fun.sample : '⚒' }

    (lightning..eurucamp).chunk(&:free?).each do |free, dates|
      puts dates.map { plans.(free) }.join ' '
    end
    # ⚛ ✈
    # ⚒ ⚒ ⚒ ⚒ ⚒
    # ✍ ♫
    # ⚒ ⚒ ⚒ ⚒ ⚒
    # ✈ ⚓
    # ⚒ ⚒ ⚒ ⚒ ⚒
    # ✂ ✍
    # ⚒ ⚒
    # ♥
    # ⚒ ⚒
