# jak to działa (w&nbsp;teorii)


## World Wide Web

https://www.tiz.tele.pw.edu.pl<br />w polu adresu przeglądarki

↓

<img src='img/tiz.png' style='width: 70%' />

Note: 11:23

jak to się dzieje, że będąc „gdziekolwiek w Internecie”
wpisujemy ten sam adres i trafia do nas strona WWW?


## DNS

www.tiz.tele.pw.edu.pl

↓

194.29.169.134

* 1983: RFC 882 + RFC 883
* 1987: RFC 1034 + RFC 1035

Note: 11:26

Domain Name System

1984: BIND (Berkeley Internet Name Domain), wciąż najpopularniejszy

RFC (obie serie): concepts and facilities + implementation and specification


## HTTP

HTML (tekst!) + inne zasoby<br />(style, skrypty, obrazy, multimedia)

↓

przeglądarka renderuje wygląd strony<br />według
własnej interpretacji danych tekstowych

* 1991: HTTP 0.9
* 1999: HTTP 1.1
* 2014: HTTP 2.0

Note: 11:33

kluczowe, że to otwarty protokół i że
dane w otwartych formatach (tekst + media)

HTTP 2.0: binarny, z wysyłką wielu strumieni
na raz i priorytetyzowaniem strumieni


## TCP

połączenie z portem 80<br />(albo 443) adresu 194.29.169.134

utrzymanie połączenia (lub wielu)<br />i zapewnienie jego jakości

* 1974: RFC 675
* 1981: RFC 793 (v4)
* 1999: RFC 2581 (Congestion Control)
* 2011: RFC 6298 (Retransmission Timer)

Note: 11:40

RFC 2581: slow start, congestion
avoidance, fast retransmit, fast recovery

RFC 6298: sposób obliczania kiedy retransmisja


## IP

dostarczanie pakietów<br />między localhostem i 194.29.169.134

* 1977: IPv0
* 1981: IPv4
* 1998: IPv6

Note: 11:43

IPv0-3: wersje deweloperskie

IPv4: adresy 32-bitowe (4,3×10⁹: 4 miliardy);

IPv6: adresy 128-bitowe (3,4×10³⁸: 340 sekstylionów)

IPv5: Internet Stream Protocol


## Ethernet

dostarczanie pakietów<br />między kartą
sieciową<br />i następnym urządzeniem

* 1973: prace w PARC
* 1983: IEEE 802.3

Note: 11:46


## warstwa fizyczna

przesyłanie bitów w medium

* 1949: kod Manchester
* 1977: telegram światłowodowy
* 1988: WaveLAN
* 1997: IEEE 802.11

<aside class='notes'>
  <p>11:53</p>
  <p>kod Manchester: kodowanie fazowe</p>
  <p>1880: fotofon Bella, 1977: pierwszy komercyjny system światłowodowy</p>
  <p>WaveLAN: pierwsza komercyjna alternatywa dla Ethernetu i Token Ringa; później 802.11</p>
</aside>
