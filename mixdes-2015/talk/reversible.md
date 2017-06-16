# reversible logic: what?

* bijective (injective + surjective)
<!-- .element: class="fragment" -->

* |inputs| = |outputs| &nbsp; &nbsp; fan-out = 1
<!-- .element: class="fragment" -->

![CNOT](img/cnot.png)
<!-- .element: class="fragment" -->

| x | y ||| x | x⊕y |
|:-:|:-:|||:-:|:---:|
| 0 | 0 ||| 0 |  0  |
| 0 | 1 ||| 0 |  1  |
| 1 | 0 ||| 1 |  1  |
| 1 | 1 ||| 1 |  0  |
<!-- .element: class="fragment" -->


# reversible logic: why?

* low power consumption
<!-- .element: class="fragment" -->

* Landauer limit: _k_ ⋅ _T_ ⋅ ln(2)<br />_k_ – Boltzmann constant<br />_T_ – temperature in kelvins<br />0.0172 eV = 2.75 zJ (in room temperature)
<!-- .element: class="fragment" -->

* 1,000 times below current dissipation<br />(that’s only 20 Moore’s-law-years)
<!-- .element: class="fragment" -->

* (de)coders: text encoding,<br />ciphers, graphic transformations…
<!-- .element: class="fragment" -->

* quantum computers
<!-- .element: class="fragment" -->
