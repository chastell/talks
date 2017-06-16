# kolizje w&nbsp;medium

Note: 15:19/15:49


## kolizje pakietów

* problem niezależny od medium

* minimalizowanie kolizji

* unikanie kolizji

* niedopuszczanie do kolizji

Note: 15:25/15:55

kolizja może nastąpić maksymalnie 2t po nadaniu,
gdzie t to max. czas transmisji w całym medium


## ALOHAnet

* Pure ALOHA: nadawanie<br />w dowolnym momencie

* brak potwierdzenia → ponowna<br />próba po losowym opóźnieniu

* Slotted ALOHA: nadawanie tylko<br />w takt (rzadszy niż długość ramki)

* wykorzystanie sieci: 18% → 37%

Note: 15:28/15:58


## CSMA

* Carrier Sense Multiple Access: nasłuch<br />
przed nadaniem czy medium jest wolne

* CSMA nonpersistent: jeśli medium<br />jest zajęte, poczekaj losowy czas

* CSMA 1-persistent: jeśli medium jest zajęte, poczekaj<br />
aż będzie wolne; wtedy natychmiast zacznij nadawać

* CSMA p-persistent: jeśli medium jest wolne,<br />
zacznij nadawać z&nbsp;prawdopodobieństwem p

Note: 15:34/16:04

nonpersistent: nieśmiała, 1-persistent: zachłanna, p-persistent: sprytna


## opóźnienia

* losowe: ALOHAnet

* rosnące wykładniczo: Ethernet

* rosnące wykładniczo z ograniczeniem:<br />rośnie do czasu, potem rezygnacja

Note: 15:38/16:08

po 10 nieudanych próbach przestaje rosnąć

po 16 próbach poddaje się


## CSMA/CD

* CSMA with Collision Detection: nasłuch też w&nbsp;trakcie
nadawania (w mediach, w których jest to możliwe)

* CSMA: kolizja wywnioskowana<br />CSMA/CD: kolizja wykrywana

* jeśli zauważono kolizję → wymuszenie kolizji

* długość ramki > okno kolizji (żeby móc wykryć)

Note: 15:42/16:12


## CSMA/CA

* CSMA with Collision Avoidance: dla mediów<br />
nie mogących nasłuchiwać w czasie wysyłania

* Distributed Coordination Function

* jeśli kanał zajęty: oczekiwanie losowego czasu

* jeśli kanał wolny: transmisja i oczekiwanie<br />
na ACK (brak ACK: retransmisja)

* DCF z Request to Send / Clear to Send<br />i czasem transmisji

Note: 15:46/16:16

DCF w WiFi, ramki RTS i CTS; nasłuchiwanie w medium przez DCF
Interframe Space i jeśli cisza to dopiero potem transmisja;
DIFS = Short Interframe Space + 2 * slottime; SIFS: czas
między ramką i jej potwierdzeniem; różny dla różnych 802.11x

DCF: binary exponential backoff


## synchronizacja

* half-duplex: preambuła, czas ramki<br />ograniczony przez okno kolizji

* Ethernet 1 Gbit/s w half-duplex:<br />krótkie ramki rozszerzane o&nbsp;okno kolizji

* Ethernet 10 Gbit/s: tylko<br />full-duplex (brak kolizji)

Note: 15:48/16:18

duplex: punkt-punkt

nie potrzeba duplexu w jednokierunkowych
(simplex): radio, telewizja, słuchawki/mikrofon

half-duplex: walkie-talkie, zmiana kierunku na hasło
„odbiór”; jednopasmowa droga dwukierunkowa + kierowanie ruchem

full-duplex: telefon (w odczuciu, de facto tak szyki half-duplex, że
nie odczuwamy); droga dwukierunkowa z więcej-niż-jednym pasem w sumie

full-duplex Ethernet: po parze kabli miedzianych w każdą stronę
(czasem po dwie); kabel staje się środowiskiem bezkolizyjnym


## błędy transmisyjne

* zbyt mała/duża długość ramki

* zła długość ramki

* nieprawidłowa suma kontrolna

* zła preambuła lub sygnał wymuszenia kolizji

* kolizja lokalna/odległa/późna

Note: 15:52/16:22

bity nie tworzą oktetów

niezgodność rzeczywistej długości z podaną


## typy kolizji

* lokalna: odbiór podczas nadawania

* odległa: błędna ramka, wywnioskowanie kolizji

* późna: kolizja po 64 oktetach: brak<br />
retransmisji, zadanie dla wastw wyższych

<aside class='notes'>
<p>15:55/16:25</p>

<p>późna: przy takiej kolizji NIC nie wysyła ponownie
pakietu, wyższe warstwy muszą się tym zająć; takie kolizje
nie powinny mieć miejsca – ich źródłem jest niedopasowanie
half-/full-duplex, zbyt długie kable lub problem sprzętowy</p>
</aside>
