# what is <span class="reek">reek</span>?

* like RuboCop,<br />but for architecture
<!-- .element: class="fragment" -->

* plug it to your<br />Rake task | CI server
<!-- .element: class="fragment" -->


## skip smells via a config file

```YAML
DataClump:
  max_copies: 2
  min_clump_size: 2

LongParameterList:
  max_params: 3
  overrides:
    initialize:
      max_params: 5

TooManyInstanceVariables:
  max_instance_variables: 9

TooManyStatements:
  exclude:
  - initialize
  max_statements: 5
```

* excludes: from `Class#method` to `/meth/`


[![Burn Your Getters](img/tom.png)](https://github.com/jcoglan/burn-your-getters)
<!-- .element: class="tom" -->


## skip smells via code comments

```Ruby
  # :reek:UtilityFunction
  def has_excited_attendees?(attendees)
    excited, indifferent = attendees.partition(&:excited?)
    excited.count > indifferent.count
  end
```

```Ruby
  # :reek:DuplicateMethodCall: { max_calls: 2 }
  def valid_module_name?(namespaced = true)
    unless namespaced
      @name.match(/\A[A-Z]\p{Letter}*\z/) unless @name.nil?
    else
      @name.match(/\A((::)?[A-Z]\p{Letter}*)+\z/) unless @name.nil?
    end
  end
```
<!-- .element: class="fragment" -->


[![refactor](img/refactor.png)](https://twitter.com/supermoof/status/478322429257715712)


## making <span class="reek">reek</span> happy with my code<br />taught me the most about OOP<br />in the last year

## but
<!-- .element: class="fragment" -->

## _always_ be critical of such tools
<!-- .element: class="fragment" -->


[![Expert Beginner](img/expert.png)](https://twitter.com/ExpertBeginner1/status/587630171634737152)
