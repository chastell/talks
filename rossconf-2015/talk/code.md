```Ruby
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
end
```

```no-highlight

  [1]:Conference has no descriptive comment (IrresponsibleModule)
  [9, 11]:Conference#has_an_acronym? calls @name.nil? 2 times (DuplicateMethodCall)
  [7]:Conference#has_an_acronym? has boolean parameter 'separated' (BooleanParameter)
  [8]:Conference#has_an_acronym? is controlled by argument separated (ControlParameter)
  [9]:Conference#has_an_acronym? performs a nil-check. (NilCheck)
  [2]:Conference#initialize has unused parameter 'city' (UnusedParameters)
```
<!-- .element: class="fragment" -->


```Ruby
class Conference
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
end
```

```no-highlight

  [2, 15, 21, 27]:Conference takes parameters [lat, lon] to 4 methods (DataClump)
  [16, 22, 28]:Conference tests @lat && @lon at least 3 times (RepeatedConditional)
  [27]:Conference#distance2 has the name 'distance2' (UncommunicativeMethodName)
```
<!-- .element: class="fragment" -->


```Ruby
class Conference
  def has_excited_attendees?(attendees)
    excited, indifferent = attendees.partition(&:excited?)
    excited.count > indifferent.count
  end
end
```

```no-highlight

  [33]:Conference#has_excited_attendees? doesn't depend on instance state (UtilityFunction)
```
<!-- .element: class="fragment" -->


```Ruby
class Conference
  def has_delighted_attendees?(attendees)
    delighted, dismayed = attendees.partition do |attendee|
      attendee.excited? or attendee.likes?(@city)
    end
    delighted.count > dismayed.count
  end
end
```

```no-highlight

  [38]:Conference#has_delighted_attendees? refers to attendee more than self (FeatureEnvy)
```
<!-- .element: class="fragment" -->
