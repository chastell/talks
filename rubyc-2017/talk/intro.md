![RubyC](img/RubyC.png)


# Ruby smells?

* not the language
<!-- .element: class="fragment" -->

* (well, maybe a bit)
<!-- .element: class="fragment" -->

* (public by default)
<!-- .element: class="fragment" -->

* (mutable by default)
<!-- .element: class="fragment" -->

* (`Enumerable` returning `Arrays` everywhere)
<!-- .element: class="fragment" -->


[![Florian](img/florian.png)](https://twitter.com/Argorak/status/591900499726757888)


[![Enumerable](img/enumerable.png)](https://twitter.com/Argorak/status/76390303401132032)


# are you saying<br />_my_ Ruby smells?

* well… yes!
<!-- .element: class="fragment" -->
* (and mine!)
<!-- .element: class="fragment" -->
* (and it’s not necessarily a bad thing!)
<!-- .element: class="fragment" -->


[![YAGNI](img/yagni.png)](https://twitter.com/dbrady/status/393071476481736704)


# code example caveats

* instance state denoted via `@instance_variables`
<!-- .element: class="fragment" -->

* (yes, I would use getters in actual code)
<!-- .element: class="fragment" -->

* assume those instance variables are<br />set in constructors | dependency injected
<!-- .element: class="fragment" -->

* (constructors skipped for simplicity)
<!-- .element: class="fragment" -->
