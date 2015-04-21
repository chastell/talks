class Conference
  def initialize(name, city, lat, lon)
    @name = name
    @lat, @lon = lat, lon
  end

  def has_an_acronym?(separated = true)
    if separated
      @name.match(/\b\P{Upper}{3,}\b/) unless @name.nil?
    else
      @name.match(/\P{Upper}{3}/) unless @name.nil?
    end
  end

  def directions(lat, lon)
    if @lat and @lon
      puts "calculating (#{@lat}, #{@lon}) → (#{lat}, #{lon}) directions…"
    end
  end

  def distance(lat, lon)
    if @lat and @lon
      puts "old calculations of (#{@lat}, #{@lon}) → (#{lat}, #{lon}) distance…"
    end
  end

  def distance2(lat, lon)
    if @lat and @lon
      puts "new calculations of (#{@lat}, #{@lon}) → (#{lat}, #{lon}) distance…"
    end
  end

  def has_excited_attendees?(attendees)
    excited, indifferent = attendees.partition(&:excited?)
    excited.count > indifferent.count
  end

  def has_delighted_attendees?(attendees)
    delighted, dismayed = attendees.partition do |attendee|
      attendee.excited? or attendee.likes?(@city)
    end
    delighted.count > dismayed.count
  end
end
