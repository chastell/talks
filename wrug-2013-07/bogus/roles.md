!SLIDE

# fake names

if the class name differs, pass it as a block

```ruby
logger = fake(:logger) { LocalScriptorium }
```

!SLIDE

# faking roles

ideally: fake roles, not classes

```ruby
logger = fake(:logger) { [LocalScriptorium, ScriptsOverAvianCarriers] }
```
