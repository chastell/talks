# wstęp: złożoność

* najczęstsze bramki w syntezie: MPMC Toffoli
<!-- .element: class="fragment" -->
* zbyt abstrakcyjne by używać ich jako operacji kwantowych
<!-- .element: class="fragment" -->
* wielu aspektów (tolerancja na uszkodzenia, korekcja błędów) nie można efektywnie rozważać na tym poziomie abstracji
<!-- .element: class="fragment" -->
* biblioteki kilku bramek kwantowych, zwykle max. 2 kubity
<!-- .element: class="fragment" -->
* aktualnie czołowa biblioteka: Clifford+T
<!-- .element: class="fragment" -->
* mapowanie bramek Toffoliego na bramki biblioteki
<!-- .element: class="fragment" -->
* dolne ograniczenie wielkości układu: wykładnicze
<!-- .element: class="fragment" -->
* dla każdej liczby zmiennych istnieje funkcja, w której<br />wielkość minimalnego układu zależy od niej wykładniczo
<!-- .element: class="fragment" -->


# wstęp: bramki ST

* bramki ST rozważa się by uniknąć złożoności wielkich funkcji
<!-- .element: class="fragment" -->
* generalizacja bramek Toffoliego
<!-- .element: class="fragment" -->
* górne ograniczenie wielkości układu z bramek ST: liniowe
<!-- .element: class="fragment" -->
* bramki ST są mapowane w kaskady bramek Toffoliego
<!-- .element: class="fragment" -->
* tu: mapowanie bezpośrednio bazujące na bramkach ST
<!-- .element: class="fragment" -->
* dekompozycja boolowska + stała liczba linii pomocniczych
<!-- .element: class="fragment" -->
* znacząca redukcja kosztu dla Clifford+T
<!-- .element: class="fragment" -->
* najlepszy przypadek: redukcja o 75%; średnia: redukcja o ~20%
<!-- .element: class="fragment" -->
