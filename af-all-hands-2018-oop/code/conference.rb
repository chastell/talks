class Conference
  attr_accessor :city
  attr_reader   :name

  def interesting?(attendee)
    case attendee
    when 'pythonista' then dynamic?
    when 'rubyist'    then laid_back?
    when 'rustacean'  then system?
    end
  end

  def ruby?(strict = true)
    if strict
      @name.include?('Ruby')
    else
      @name.include?('Ru')
    end
  end

  def nav_info(source_lat, source_lon)
    dist = @nav_source.info(from: [source_lat, source_lon], to: [@lat, @lon]).dist
    time = @nav_source.info(from: [source_lat, source_lon], to: [@lat, @lon]).time
    { dist: dist, time: time }
  end

  def directions(source_lat, source_lon)
    if @lat && @lon
      @nav_source.directions(from: [source_lat, source_lon], to: [@lat, @lon])
    end
  end

  def distance(source_lat, source_lon)
    if @lat && @lon
      @nav_source.distance(from: [source_lat, source_lon], to: [@lat, @lon])
    end
  end

  def needs_passport?(source_lat, source_lon)
    if @lat && @lon
      @nav_source.borders?(from: [source_lat, source_lon], to: [@lat, @lon])
    end
  end

  def successful?(attendees)
    excited, indifferent = attendees.partition do |attendee|
      attendee.excited? || @language == 'Ruby' && attendee.rubyist?
    end
    excited.count > indifferent.count
  end
end
