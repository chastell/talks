# Ruby Smells

<h3 class='fragment'>
  ![Pivorak](img/pivorak.png)
  <!-- .element: style="width: 15%" -->
  <br />
  Pivorak Edition
</h3>


![Rooster](img/rooster.jpg)
<!-- .element: style="width: 50%" -->


![Pivorak](img/pivorak.png)
<!-- .element: style="width: 50%" -->


# code example caveats

* instance state denoted via `@instance_variables`
<!-- .element: class="fragment" -->

* assume those instance variables are<br />set in constructors | dependency injected
<!-- .element: class="fragment" -->
* (constructors skipped for simplicity)
<!-- .element: class="fragment" -->
* (yes, I would use getters in actual code)
<!-- .element: class="fragment" -->
* (yes, some examples are very badly refactored)
<!-- .element: class="fragment" -->
