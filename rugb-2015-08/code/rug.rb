class RUG
  def initialize(name, city = nil, lat = nil, lon = nil)
    @name = name
    @lat, @lon = lat, lon
  end

  def valid_module_name?(namespaced = true)
    unless namespaced
      @name.match(/\A[A-Z]\p{Letter}*\z/) unless @name.nil?
    else
      @name.match(/\A((::)?[A-Z]\p{Letter}*)+\z/) unless @name.nil?
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
