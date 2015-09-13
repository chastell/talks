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


# _Ruby_ smells?

* not the implementation(s)
<!-- .element: class="fragment" -->

* (well, maybe a bit)
<!-- .element: class="fragment" -->

* [`Matrix::EigenvalueDecomposition#hessenberg_to_real_schur`](https://github.com/ruby/ruby/blob/v2_2_3/lib/matrix/eigenvalue_decomposition.rb#L446-L879)<br />(433 lines)
<!-- .element: class="fragment" -->

* [`TkItemConfigMethod#__itemconfiginfo_core`](https://github.com/ruby/ruby/blob/v2_2_3/ext/tk/lib/tk/itemconfig.rb#L406-L1164)<br />(759 lines)
<!-- .element: class="fragment" -->

* [`RDoc::Markdown#_Code`](https://github.com/ruby/ruby/blob/v2_2_3/lib/rdoc/markdown.rb#L12246-L13840)<br />(1595 lines)
<!-- .element: class="fragment" -->


[![refactor](img/refactor.png)](https://twitter.com/supermoof/status/478322429257715712)


# are you saying<br />_my_ Ruby smells?

* well… yes!
<!-- .element: class="fragment" -->
* (and mine!)
<!-- .element: class="fragment" -->
* (and it’s not necessarily a bad thing!)
<!-- .element: class="fragment" -->


* [![Martin Fowler](img/code_smell_fowler.png)](http://martinfowler.com/bliki/CodeSmell.html)
<!-- .element: class="fowler" -->


* [![WikiWikiWeb](img/code_smell_c2.1.png)](http://c2.com/cgi/wiki?CodeSmell)


* [![WikiWikiWeb](img/code_smell_c2.2.png)](http://c2.com/cgi/wiki?CodeSmell)


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
