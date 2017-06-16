# motywacja

* użycie bramek MCT o dowolnej liczbie linii kontrolnych
<!-- .element: class="fragment" -->
* użycie bramek MPMCT
<!-- .element: class="fragment" -->
* biblioteki bramek kwantowych: kilka bramek, max. 2 kubity
<!-- .element: class="fragment" -->
* czołowe biblioteki: NCV i Clifford+T
<!-- .element: class="fragment" -->
* Clifford+T: dobre własności w obliczeniach<br />kwantowych odpornych na uszkodzenia
<!-- .element: class="fragment" -->
* minimalne realizacje tylko dla bramki 2CT
<!-- .element: class="fragment" -->

![2-controlled Toffoli](img/2CT.png)
<!-- .element: class="fragment screenshot" -->


# motywacja

![MCT recursion](img/MCT recursion.png)
<!-- .element: class="screenshot" -->

* dla _c ≥ 3_ linii kontrolnych 2 bramki o _m_ liniach kontrolnych
<!-- .element: class="fragment" -->

* i 2 bramki o _c − m + 1_ liniach kontrolnych, _m ∈ {2, …, c − 2}_
<!-- .element: class="fragment" -->

* brak wolnych linii: linia pomocnicza (odtwarzana)
<!-- .element: class="fragment" -->

* rekursyjnie aż wszystkie bramki będą 2CT
<!-- .element: class="fragment" -->

* ST: dekompozycja XOR → kaskada MPMCT i jak wyżej
<!-- .element: class="fragment" -->

* a co jeśli bi-dekompozycja / Ashenhurst / Curtis?
<!-- .element: class="fragment" -->
