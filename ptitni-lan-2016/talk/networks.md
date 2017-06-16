# łączenie sieci


## podział według warstw

<table>
  <caption>elementy sieciowe</caption>
  <tr>
    <th>warstwa OSI</th>
    <th colspan='2' style='border: none'></th>
  </tr>
  <tr>
    <td>aplikacji</td>
    <td rowspan='4'>brama</td>
    <td>switch L7</td>
  </tr>
  <tr>
    <td>prezentacji</td>
    <td></td>
  </tr>
  <tr>
    <td>sesji</td>
    <td></td>
  </tr>
  <tr>
    <td>transportowa</td>
    <td>switch L4</td>
  </tr>
  <tr>
    <td>sieciowa</td>
    <td>router</td>
    <td>switch L3</td>
  </tr>
  <tr>
    <td>łącza danych</td>
    <td>mostek</td>
    <td>switch L2</td>
  </tr>
  <tr>
    <td>fizyczna</td>
    <td>hub</td>
    <td>switch L1</td>
  </tr>
</table>


## hub

* warstwa fizyczna

* segmenty tego samego<br />typu, wspólne medium

* pasywny lub aktywny

Note:

repeater i hub nie są granicą domeny kolizyjnej

inteligentny: zbiera statystyki

wspólne medium: ograniczenie szybkości
urządzeń do ułamka szybkości operacyjnej sieci

łączy urządzenia we wspólny segment sieci

sygnał z każdego portu na pozostałych

forwardowanie wszędzie sygnału jam przy detekcji kolizji


## mostek

* warstwa MAC

* przezroczysty

* między sieciami<br />różnych typów

Note:

mostek i wyżej jest granicą domeny kolizyjnej

dwa segmenty sieci stanowią połączoną sieć

mostkowanie: proste, wieloportowe, uczące się/przezroczyste, source
route (ze sterowanym źródłem, do token ring), łączony (source routing
transparent – pozwala na współistnienie obu, używając source routing
z hostami, które to wspierają, i transparent z resztą)


## router

* ma własny adres MAC

* kieruje pakiety do odpowiednich<br />hostów lub innych routerów

* segmentuje, scala,<br />buforuje pakiety

* obsługuje błędy

Note:

router w sieci domowej

kieruje pakiety na podstawie tablicy routującej


## switch

* rozdział domen kolizyjnych<br />od rozgłoszeniowych

* L1: działa jak hub

* L2: działa jak mostek

* L3: działa jak router

* L4: NAT i równoważenie TCP

* L7: proxy WWW, CDN

Note:

protokół drzewa opinającego: gwarantuje, że nawet jeśli w sieci są pętle
(a dobrze, gdy są), to między dwoma węzłami będzie tylko jedna ścieżka


## kierowanie pakietów

* mostkowanie przezroczyste: równorzędne<br />
porty, selekcja tylko jeśli znany port adresata

* przełączanie ekspresowe: osobny port szkieletowy,<br />na
który kierowane są ramki o&nbsp;nieznanym porcie adresata

Note:

ekspresowy nie uczy się adresów z ramek z portu
szkieletowego, na początku działania gubi pakiety

switch wysyła wiadomość rozgłoszeniową z prośbą o odpowiedź, nasłuchując
odpowiedzi buduje tablicę kto w którym porcie (tablica na jakiś czas)

nie blokują wiadomości rozgłoszeniowych (broadcast, MAC ff:ff:ff:ff:ff:ff)


## tryby pracy

* cut-through: przepuszcza pakiety w miarę napływania

* fragment-free: eliminacja ramek<br />jeśli błąd w&nbsp;pierwszych 64 oktetach

* store-and-forward: eliminacja błędnych ramek,<br />
buforowanie kosztem aplikacji czułych na opóźnienia

Note:

przełączanie inteligentne: gdy mniejszy ruch
cut-through, gdy większy store-and-forward


## niedopasowanie sieci

* różne długości ramek

* różne szybkości transmisji

* różne poziomy priorytetów pakietów

<aside class='notes'>
  <p>długości: IEEE 802.3: 1518/1526 B; Token Ring:
  4500/8000 B, FDDI: 4500 B; DQDB (MAN): 9188 B</p>

  <p>szybkości: IEEE 802.3: do 100 MBit/s; Token Ring:
  4/16 MBit/s, FDDI: 100 MBit/s; DQDB (MAN): 150 Mbit/s</p>

  <p>priorytety: IEEE 802.3: brak; Token Ring: 8 poziomów (opc.),
  FDDI: 8 poziomów (asynch.); DQDB (MAN): 3 poziomy (opc.)</p>

  <p>poprawa szybkości: segmentacja sieci; mosty przekazują
  jedną ramkę na raz, wspólna sieć szkieletowa, ale
  burze broadcastowe; routery droższe i wolniejsze</p>

  <p>poprawa szybkości: switche</p>
</aside>
