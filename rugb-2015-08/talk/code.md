```Ruby
class RUG
  def initialize(name, city, lat, lon)
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
end
```

```no-highlight

  [1]:RUG has no descriptive comment (IrresponsibleModule)
  [11, 9]:RUG#valid_module_name? calls @name.nil? 2 times (DuplicateMethodCall)
  [7]:RUG#valid_module_name? has boolean parameter 'namespaced' (BooleanParameter)
  [8]:RUG#valid_module_name? is controlled by argument namespaced (ControlParameter)
  [11]:RUG#valid_module_name? performs a nil-check (NilCheck)
  [2]:RUG#initialize has unused parameter 'city' (UnusedParameters)
```
<!-- .element: class="fragment" -->


[![code comments](img/code_comments.png)](https://twitter.com/nzkoz/status/538892801941848064)
<!-- .element: class="nzkoz" -->


```Ruby
class RUG
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

  [2, 15, 21, 27]:RUG takes parameters [lat, lon] to 4 methods (DataClump)
  [16, 22, 28]:RUG tests @lat && @lon at least 3 times (RepeatedConditional)
  [27]:RUG#distance2 has the name 'distance2' (UncommunicativeMethodName)
```
<!-- .element: class="fragment" -->


```Ruby
class RUG
  def has_excited_attendees?(attendees)
    excited, indifferent = attendees.partition(&:excited?)
    excited.count > indifferent.count
  end
end
```

```no-highlight

  [33]:RUG#has_excited_attendees? doesn't depend on instance state (UtilityFunction)
```
<!-- .element: class="fragment" -->


```Ruby
class RUG
  def has_delighted_attendees?(attendees)
    delighted, dismayed = attendees.partition do |attendee|
      attendee.excited? or attendee.likes?(@city)
    end
    delighted.count > dismayed.count
  end
end
```

```no-highlight

  [40, 40]:RUG#has_delighted_attendees? refers to attendee more than self (FeatureEnvy)
```
<!-- .element: class="fragment" -->


[![YAGNI](img/yagni.png)](https://twitter.com/dbrady/status/393071476481736704)
