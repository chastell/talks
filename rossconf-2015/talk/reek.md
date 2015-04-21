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
  def has_an_acronym?(separated = true)
    if separated
      @name.match(/\b\P{Upper}{3,}\b/) unless @name.nil?
    else
      @name.match(/\P{Upper}{3}/) unless @name.nil?
    end
  end
```
<!-- .element: class="fragment" -->


## making <span class="reek">reek</span> happy with my code<br />taught me the most about OOP<br />in the last year

## but
<!-- .element: class="fragment" -->

## _always_ be critical of such tools
<!-- .element: class="fragment" -->


[![contributors](img/contributors.png)](https://github.com/troessner/reek/graphs/contributors)


## s-expressions

```Ruby
class Conference
  def has_an_acronym?(separated = true)
    if separated
      @name.match(/\b\P{Upper}{3,}\b/) unless @name.nil?
    else
      @name.match(/\P{Upper}{3}/) unless @name.nil?
    end
  end
end
```


```
(class
  (const nil :Conference) nil
  (def :has_an_acronym?
    (args
      (optarg :separated
        (true)))
    (if
      (lvar :separated)
      (if
        (send
          (ivar :@name) :nil?) nil
        (send
          (ivar :@name) :match
          (regexp
            (str "\bP{Upper}{3,}\b")
            (regopt))))
      (if
        (send
          (ivar :@name) :nil?) nil
        (send
          (ivar :@name) :match
          (regexp
            (str "P{Upper}{3}")
            (regopt)))))))
```


### [_How <span class="reek">reek</span> works internally_](https://github.com/troessner/reek/wiki/How-reek-works-internally)

```no-highlight
            [bin/reek]
                |
                |
                |
          Application (cli/application.rb) +
          Options (cli/options)
                |
                |
                |
      ReekCommand (cli/reek_command)
      with Reporter (cli/report/report)
          /     |    \
         /      |     \
        /       |      \
    Source   Source   Source (source/source_code)
    |           |          |
    |           |          |
    |           |          |
 Examiner   Examiner  Examiner (examiner)
                |
                |
                |
    Examiner sets up a:
      - SourceRepository (source/source_repository)
      - a WarningCollector (core/warning_collector)

    The Examiner then goes through each source:
      - Initializing a SmellRepository (core/smell_repository)
      - getting the AST from the source
      - applying a TreeWalker(core/tree_walker) to process this syntax tree given the SmellRepository
      - finally have that SmellRepository reporting back on the WarningCollector mentioned above
                |
                |
                |
    In the last step, the reporter from the ReekCommand:
      - gathers all the warnings from the collectors of all Examiners (as you can see here https://github.com/troessner/reek/blob/master/lib/reek/cli/report/report.rb#L30)
      - outputs them with whatever output format we have chose via the cli options
```
<!-- .element: class="ascii-diagram" -->
