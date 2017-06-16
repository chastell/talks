# jak to działa (w&nbsp;teorii)


<img src='img/tower.jpg' />


<img src='img/switchboard.jpg' style='width: 50%' />


<img src='img/1969.jpg' />

wrzesień 1969


<img src='img/1969.4.jpg' style='width: 50%' />

grudzień 1969


<img src='img/1972.jpg' />

1972


## World Wide Web

https://www.tiz.tele.pw.edu.pl<br />w polu adresu przeglądarki

↓

<img src='img/tiz.png' style='width: 70%' />

Note:

Jak to się dzieje, że będąc „gdziekolwiek w Internecie”
wpisujemy ten sam adres i trafia do nas ta sama strona WWW?


## DNS

www.tiz.tele.pw.edu.pl

↓

194.29.169.134

* 1983: RFC 882 + RFC 883
* 1987: RFC 1034 + RFC 1035

Note:

Podstawą dzisiejszej World Wide Web jest DNS (Domain Name System),
system rowziązywania przyjaznych dla użytkownika nazw domen (np.
`www.tele.pw.edu.pl`) na ich numery IP (np. `194.29.169.129`).

Sposób działania DNS zostały po raz pierwszy zdefiniowany w 1983 (RFC
882 + RFC 883), a następnie poprawiony w 1987 (RFC 1034 + RFC 1035) –
w obu przypadkach definicje zostały rozbite na _concepts and facilities_
oraz _implementation and specification_. W 1984 powstał BIND (Berkeley
Internet Name Domain), wciąż najpopularniejszy serwer DNS.


## HTTP

HTML (tekst!) + inne zasoby<br />(style, skrypty, obrazy, multimedia)

↓

przeglądarka renderuje wygląd strony<br />według
własnej interpretacji danych tekstowych

* 1991: HTTP 0.9
* 1999: HTTP 1.1
* 2014: HTTP 2.0

Note:

Po uzyskaniu (za pomocą DNS) numeru IP serwera przeglądarka
rozpoczyna komunikację, przesyłając za pomocą protokołu
HTTP (Hypertext Transfer Protocol) wszelkie zasoby
potrzebne, by przedstawić stronę użytkownikowi.

Kluczową dla popularności WWW stała się otwartość
protokołu oraz formatów danych (zarówno tekstu w formacie
HTML jak i mediów w otwartych formatach binarnych).

Od 2014 istnieje najnowsza wersja protokołu HTTP, HTTP 2.0: jest
to format binarny (ale wciąż otwarty), z wysyłką wielu strumieni na
raz i priorytetyzowaniem strumieni, co pozwala znacznie przyspieszyć
dostarczenie istotnych danych (np. „wszystkie zasoby wymagane do
wyświetlenia górnej części strony”) do przeglądarki użytkownika.


## TCP

połączenie z portem 80<br />(albo 443) adresu 194.29.169.134

utrzymanie połączenia (lub wielu)<br />i zapewnienie jego jakości

* 1974: RFC 675
* 1981: RFC 793 (v4)
* 1999: RFC 2581 (Congestion Control)
* 2011: RFC 6298 (Retransmission Timer)

Note:

Ruch HTTP odbywa się dzięki ustanowieniu niezawodnego połączenia
między komputerem użytkwnika i serwerem oraz wymiany danych za pomocą
protokołu TCP (Transmission Control Protocol). To połączenie ustanawiane
jest z „powszechnie znanym” numerem portu serwera (w przypadku
HTTP to port 80, w przypadku szyfrowanego HTTPS to port 443).

Choć sam protokół TCP jest jednym z najstarszych spośród protokołów
tworzących współczesny Internet (jego pierwsza wersja powstała w 1974)
wciąż jest udoskonalany, np. opublikowany w 1999 RFC 2581 definiuje
tzw. powolne rozpoczęcie (_slow start_), zasady unikania przeciążeń
(_congestion avoidance_), szybką retransmisję (_fast retransmit_)
oraz szybką regenerację połączenia (_fast recovery_), a opublikowany
w 2011 RFC 6298 sposób obliczania kiedy powinna nastąpić retransmisja.


## IP

dostarczanie pakietów<br />między localhostem i 194.29.169.134

* 1977: IPv0
* 1981: IPv4
* 1998: IPv6

Note:

Protokołem wykorzystywanym przez TCP do transmisji danych jest IP
(Internet Protocol) – protokół łączący dwa hosty, stworzony w późnych
latach 70. (wersje deweloperskie IPv0-3). W 1981 powstała wciąż
powszechnie używana wersja IPv4, używająca 32-bitowych adresów hostów
(4,3×10⁹: 4 miliardy hostów), a od coraz popularniejsza staje się wersja
IPv6, stosująca adresy 128-bitowe (3,4×10³⁸: 340 sekstylionów hostów).

(Powstały w międzyczasie IPv5 to Internet Stream
Protocol, służący do wysyłania danych strumieniowych.)


## Ethernet

dostarczanie pakietów<br />między kartą
sieciową<br />i następnym urządzeniem

* 1973: prace w PARC
* 1983: IEEE 802.3

Note:

Dostarczanie pakietów IP odbywa się za pomocą protokołu
Ethernet, obsługującego połączenia między każdymi dwoma
kolejnymi urządzeniami. Pierwsza wersja protokołu powstała
w pierwszej połowie 1973 roku, a od 1983 tworzona jest
rodzina powszechnie dziś stosowanych standardów IEEE 802.3.


## warstwa fizyczna

przesyłanie bitów w medium

* 1949: kod Manchester
* 1977: telegram światłowodowy
* 1988: WaveLAN
* 1997: IEEE 802.11

Note:

Poszczególne bity danych Ethernetu przesyłane są w danym medium (np.
miedź, światłowód, powietrze) za pomocą protokołów warstwy fizycznej.

Kod Manchester, stosowany w mediach typu miedź i używający kodowania
fazowego, powstały po II wojnie światowej – ale już w XIX w. (1880)
istniały takie urządzenia jak fotofon Bella, a w 1977 powstał pierwszy
komercyjny system światłowodowy. W 1988 stworzono WaveLAN: pierwszą
komercyjną alternatywę dla Ethernetu i Token Ringa, na podstawie
której zdefiniowano rodzinę standardów IEEE 802.11 (WiFi).
