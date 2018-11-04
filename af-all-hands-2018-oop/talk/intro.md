# do our _languages_ smell?

* maybe a bit
<!-- .element: class="fragment" -->

* public by default
<!-- .element: class="fragment" -->

* mutable by default
<!-- .element: class="fragment" -->

* Ruby: `Enumerable` returning `Arrays` everywhere
<!-- .element: class="fragment" -->


[![Enumerable](img/enumerable.png)](https://twitter.com/Argorak/status/76390303401132032)


# are you saying<br />_my_ code smells?

* well… yes!
<!-- .element: class="fragment" -->
* (and mine!)
<!-- .element: class="fragment" -->
* (and it’s not necessarily a bad thing!)
<!-- .element: class="fragment" -->


[![YAGNI](img/yagni.png)](https://twitter.com/dbrady/status/393071476481736704)


# code example caveats

* the talk applies to most languages,<br />but uses Ruby examples
<!-- .element: class="fragment" -->

* instance state denoted via `@instance_variables`
<!-- .element: class="fragment" -->

* (yes, I would use getters in actual code)
<!-- .element: class="fragment" -->

* assume those instance variables are<br />set in constructors | dependency injected
<!-- .element: class="fragment" -->

* (constructors skipped for simplicity)
<!-- .element: class="fragment" -->
