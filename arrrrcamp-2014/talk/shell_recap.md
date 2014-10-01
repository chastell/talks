# shell recap

* non-IO? `Kernel#system` with separate arguments
<!-- .element: class="fragment" -->

*  simple IO? <code>Kernel#&#96;</code> with `shellwords`
<!-- .element: class="fragment" -->

* stdin + stdout + stderr + thread? `open3`
<!-- .element: class="fragment" -->

* check out `pty` (1999) and `shell` (2001)
<!-- .element: class="fragment" -->

* use `pathname` everywhere
<!-- .element: class="fragment" -->

* terminal size? `io/console`
<!-- .element: class="fragment" -->
