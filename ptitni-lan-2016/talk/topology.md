# topologie sieci


## topologia fizyczna

* jak zbudowana jest warstwa fizyczna LAN

* okablowanie – ale też medium bezprzewodowe

* &nbsp;

## topologia logiczna

* jak zbudowane są podwarstwy MAC i LLC

Note:

mogą być też topologie mieszane


## punkt-punkt

<img src='img/point_point.svg' style='width: 30%' />

* połączenie po porcie szeregowym

* skrętka skrosowana


## szyna

<img src='img/bus.svg' style='width: 30%' />

* Ethernet na koncentryku,<br />WLAN (fizyczna i&nbsp;logiczna)

* wspólne medium

* awaria stacji nie szkodzi sieci

Note:

czas propagacji zależy od odległości między stacjami / długości medium

plus: mała długość kabla

minus: niewielka liczba punktów koncentracji


## pierścień

<img src='img/ring.svg' style='width: 30%' />

* Token Ring (logiczna)

* możliwość różnych łącz w jednym pierścieniu

* awaria dowolnego elementu paraliżuje sieć

* trudna lokalizacja uszkodzeń

Note:

układ zamknięty, połączenie nadajników z odbiornikami

plus: krótszy kabel niż dla gwiazdy


## gwiazda

<img src='img/star.svg' style='width: 30%' />

* Ethernet spięty hubem (fizyczna i logiczna)<br
/>lub switchem (logiczna), Token Ring (fizyczna)

* element centralny odpowiada za cały ruch

* awaria elementu centralnego paraliżuje sieć

Note:

plusy: łatwość utrzymania i modyfikacji okablowania


## drzewo

<img src='img/tree.svg' style='width: 30%' />

* rozproszona gwiazda

* kolejne poziomy bez ograniczeń

* łatwa lokalizacja uszkodzeń

Note:

plus: łatwość rozbudowy

minus: zależność od głównej magistrali


## siatka / krata

<img src='img/mesh.svg' style='display: inline; width: 25%' />
<img src='img/full_mesh.svg' style='display: inline; width: 25%' />

* punkt-punkt; krata: każdy z każdym

* skomplikowany routing

* awarie nie uniemożliwiają routingu

* tania dla sieci bezprzewodowych

<aside class='notes'>
  <p>zaawansowane metody routingowe</p>
  <p>minusy: duży koszt, dużo kabli i portów</p>
</aside>
