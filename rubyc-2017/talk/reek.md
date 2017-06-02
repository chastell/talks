# so… how can we find code smells in our Ruby apps?

* by hand
<!-- .element: class="fragment" -->

* using <span class='reek'>Reek</span>
<!-- .element: class="fragment" -->


![Reek](img/reek.text.png)
<!-- .element: style="width: 50%" -->

* very opinionated
<!-- .element: class="fragment" -->
* static code analyser
<!-- .element: class="fragment" -->
* for finding smells
<!-- .element: class="fragment" -->
* RuboCop for architecture
<!-- .element: class="fragment" -->


# <span class='reek'>Reek</span> usage

```nohighlight
$ gem install reek
```
<!-- .element: class="fragment" -->

```nohighlight
$ reek --no-wiki-links conference.rb
```
<!-- .element: class="fragment" -->

```nohighlight
conference.rb -- 8 warnings:
```
<!-- .element: class="fragment" -->

```nohighlight
  [40, 42]:DuplicateMethodCall: Conference#nav_info calls
  @nav_source.info(from: [start_lat, start_lon], to: [@lat, @lon]) 2 times
```
<!-- .element: class="fragment" -->

```nohighlight
  [21, 27, 33]:DataClump: Conference takes parameters [start_lat, start_lon] to 3 methods
```
<!-- .element: class="fragment" -->

```nohighlight
  [22, 28, 34]:RepeatedConditional: Conference tests @lat && @lon at least 3 times
```
<!-- .element: class="fragment" -->

```nohighlight
  [13]:BooleanParameter: Conference#ruby? has boolean parameter 'strict'
```
<!-- .element: class="fragment" -->

```nohighlight
  [14]:ControlParameter: Conference#ruby? is controlled by argument strict
```
<!-- .element: class="fragment" -->

```nohighlight
  [51, 51]:FeatureEnvy: Conference#successful? refers to attendee more than self
```
<!-- .element: class="fragment" -->

```nohighlight
  [2]:Attribute: Conference#city is a writable attribute
```
<!-- .element: class="fragment" -->

```nohighlight
  [1]:IrresponsibleModule: Conference has no descriptive comment
```
<!-- .element: class="fragment" -->


[![code comments](img/code_comments.png)](https://twitter.com/nzkoz/status/538892801941848064)
<!-- .element: class="nzkoz" -->


[![code is documentation](img/code_is_documentation.png)](https://twitter.com/tef_ebooks/status/638142134881779712)


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
  def nav_info(start_lat, start_lon)
    dist = @nav_source.info(from: [start_lat, start_lon], to: [@lat, @lon]).dist
    time = @nav_source.info(from: [start_lat, start_lon], to: [@lat, @lon]).time
    { dist: dist, time: time }
  end
```
<!-- .element: class="fragment" -->


## per-directory configuration

[![moving from Rails](img/rails.png)](https://twitter.com/jessitron/status/627528493300105216)
<!-- .element: class="fragment" -->
