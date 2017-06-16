# application of decomposition<br />to reversible logic synthesis

* decompose the large non-reversible function<br />into small non-reversible functions
<!-- .element: class="fragment" -->

* embed individual, small functions<br />(turn them into small reversible functions)
<!-- .element: class="fragment" -->

* implement small reversible functions<br />(optimally, because they’re small)
<!-- .element: class="fragment" -->

* recompose reversible functions<br />(the way the non-reversible ones were composed)
<!-- .element: class="fragment" -->


# decomposition + synthesis flow

![flow](img/flow.png)

* decomposition: custom tool built for FPGA synthesis
* synthesis + verification: RevKit, University of Bremen
