# so… how can we find code smells in our Ruby apps?

* by hand
<!-- .element: class="fragment" -->

* using <span class='reek'>reek</span>
<!-- .element: class="fragment" -->


# <span class='reek'>reek</span>

* very opinionated
<!-- .element: class="fragment" -->
* static code analyser
<!-- .element: class="fragment" -->
* for finding smells
<!-- .element: class="fragment" -->
* RuboCop for architecture
<!-- .element: class="fragment" -->


# <span class='reek'>reek</span> usage

```nohighlight
$ gem install reek
```
<!-- .element: class="fragment" -->

```nohighlight
$ reek conference.rb
```
<!-- .element: class="fragment" -->

```nohighlight
conference.rb -- 9 warnings:
```
<!-- .element: class="fragment" -->

```nohighlight
  [40, 42]:Conference#weather_assessment calls @weather_source.weather_at(@city) 2 times (DuplicateMethodCall)
```
<!-- .element: class="fragment" -->

```nohighlight
  [21, 27, 33]:Conference takes parameters [source_lat, source_lon] to 3 methods (DataClump)
```
<!-- .element: class="fragment" -->

```nohighlight
  [22, 28, 34]:Conference tests @lat && @lon at least 3 times (RepeatedConditional)
```
<!-- .element: class="fragment" -->

```nohighlight
  [6]:Conference#interesting? is controlled by argument attendee (ControlParameter)
```
<!-- .element: class="fragment" -->

```nohighlight
  [13]:Conference#ruby? has boolean parameter 'strict' (BooleanParameter)
```
<!-- .element: class="fragment" -->

```nohighlight
  [14]:Conference#ruby? is controlled by argument strict (ControlParameter)
```
<!-- .element: class="fragment" -->

```nohighlight
  [51, 51]:Conference#successful? refers to attendee more than self (FeatureEnvy)
```
<!-- .element: class="fragment" -->

```nohighlight
  [2]:Conference#city is a writable attribute (Attribute)
```
<!-- .element: class="fragment" -->

```nohighlight
  [1]:Conference has no descriptive comment (IrresponsibleModule)
```
<!-- .element: class="fragment" -->


[![code comments](img/code_comments.png)](https://twitter.com/nzkoz/status/538892801941848064)
<!-- .element: class="nzkoz" -->


[![code is documentation](img/code_is_documentation.png)](https://twitter.com/tef_ebooks/status/638142134881779712)


[![naming](img/naming.png)](https://twitter.com/nelhage/status/632312441657946112)


## configuration: `.reek`

```yaml
DataClump:
  max_copies: 2
  min_clump_size: 2

```
<!-- .element: class="fragment" -->

```yaml
LongParameterList:
  max_params: 3
  overrides:
    initialize:
      max_params: 5
```
<!-- .element: class="fragment" -->

```yaml
TooManyInstanceVariables:
  max_instance_variables: 4
```
<!-- .element: class="fragment" -->

```yaml
TooManyStatements:
  exclude:
  - initialize
  max_statements: 5
```
<!-- .element: class="fragment" -->

* <span class='fragment'>excludes: from `Class#method` to `/meth/`</span>


[![Expert Beginner](img/expert.png)](https://twitter.com/ExpertBeginner1/status/587630171634737152)


## configuration: code comments

```ruby
  # :reek:UtilityFunction
  def successful?(attendees)
    excited, indifferent = attendees.partition(&:excited?)
    excited.count > indifferent.count
  end
```
<!-- .element: class="fragment" -->

```ruby
  # :reek:DuplicateMethodCall: { max_calls: 2 }
  def weather_assessment
    if @weather_source.weather_at(@city).skies == :clear
      'Too sunny'
    elsif @weather_source.weather_at(@city).temp > 20
      'Too hot'
    else
      'Perfect for coding'
    end
  end
```
<!-- .element: class="fragment" -->


## per-directory configuration

[![moving from Rails](img/rails.png)](https://twitter.com/jessitron/status/627528493300105216)
<!-- .element: class="fragment" -->
