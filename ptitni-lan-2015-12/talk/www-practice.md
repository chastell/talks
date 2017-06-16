# jak to działa (w&nbsp;praktyce)


```
$ dig www.tele.pw.edu.pl

; <<>> DiG 9.9.5-3ubuntu0.1-Ubuntu <<>> www.tele.pw.edu.pl
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 3528
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 2, AUTHORITY: 4, ADDITIONAL: 2

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;www.tele.pw.edu.pl.		IN	A

;; ANSWER SECTION:
www.tele.pw.edu.pl.	86400	IN	CNAME	cygnus.tele.pw.edu.pl.
cygnus.tele.pw.edu.pl.	86400	IN	A	194.29.169.129

;; AUTHORITY SECTION:
tele.pw.edu.pl.		86400	IN	NS	europa.coi.pw.edu.pl.
tele.pw.edu.pl.		86400	IN	NS	proton.elka.pw.edu.pl.
tele.pw.edu.pl.		86400	IN	NS	twister.tele.pw.edu.pl.
tele.pw.edu.pl.		86400	IN	NS	io.coi.pw.edu.pl.

;; ADDITIONAL SECTION:
twister.tele.pw.edu.pl.	86400	IN	A	194.29.169.131

;; Query time: 0 msec
;; SERVER: 194.29.169.134#53(194.29.169.134)
;; WHEN: Fri Jan 09 10:26:19 CET 2015
;; MSG SIZE  rcvd: 190
```

Note:

`dig`: przykład pobierania informacji o rozwiązaniu
domeny `www.tele.pw.edu.pl` na adres IP.


```
$ curl -v www.tele.pw.edu.pl
* Rebuilt URL to: www.tele.pw.edu.pl/
* Hostname was NOT found in DNS cache
*   Trying 194.29.169.129...
* Connected to www.tele.pw.edu.pl (194.29.169.129) port 80 (#0)
> GET / HTTP/1.1
> User-Agent: curl/7.35.0
> Host: www.tele.pw.edu.pl
> Accept: */*
> 
< HTTP/1.1 200 OK
< Date: Fri, 09 Jan 2015 09:26:09 GMT
* Server Apache is not blacklisted
< Server: Apache
< Last-Modified: Mon, 10 Mar 2014 22:21:53 GMT
< ETag: "27c0b8-170f-4f44807d40240"
< Accept-Ranges: bytes
< Content-Length: 5903
< Content-Type: text/html
< 
<HTML>
<HEAD>
<TITLE>Instytut Telekomunikacji</TITLE>
…
<META http-equiv="Content-Type" content="text/html; charset=iso-8859-2">
<META content="Instytut Telekomunikacji Politechniki Warszawskiej" name=DESCRIPTION>
…
<link rel="stylesheet" href="it_style.css" type="text/css">
<link rel="shortcut icon" href="favicon.ico">
…
</head>
<body …>
…
  	  	   <span class="nakolorowo">Dzia�alno��</span> IT obejmuje zaj�cia dydaktyczne, projekty badawcze krajowe i zagraniczne oraz
	  	   projekty i prace badawczo rozwojowe dla firm z sektora telekomunikacyjnego...
	  	   <a href="dzialalnosc.html">Wi�cej</a>
…
</body>
</html>
* Connection #0 to host www.tele.pw.edu.pl left intact
```

Note:

`curl` – przykład pobierania pliku HTML za pomocą protokołu HTTP.

Co istotne, protokół HTTP wspiera nie tylko powszechnie znane
metody GET (pobieranie danych) i POST (wysyłanie danych) – ale
też DELETE, PUT, HEAD, PATCH, TRACE („echo”, powzwalające zobaczyć
jak zapytanie jest modyfikowane między serwerami) i inne. Na
bazie HTTP powstał też WebDAV: protokół tworzący tzw. _read-write
medium_, pozwalający na edycję i zarządzanie dokumentami.


## UDP i TCP

* `socket()`
* `bind()`
* `listen()`
* `accept()`
* `read()` + `write()`
* `close()`

* datagramy vs połączenia

Note:

Przesyłanie danych za pomocą protokołów TCP (protokół połączeniowy)
i UDP (User Datagram Protocol, protokół bezpołączeniowy) obsługiwane
są na poziomie systemu operacyjnego za pomocą standardowego zestawu
metod obsługi gniazd (_sockets_), co pozwala tworzyć oprogramowanie
pracujące ze stosem TCP/IP w dowolnych językach programowania.


<table>
  <caption>pakiet UDP</caption>
  <tr>
    <th style='border: none'></th>
    <th colspan='8' style='width: 20%'>0</th>
    <th colspan='8' style='width: 20%'>1</th>
    <th colspan='8' style='width: 20%'>2</th>
    <th colspan='8' style='width: 20%'>3</th>
  </tr>
  <tr>
    <th>0</th>
    <td colspan='16'>port źródłowy</td>
    <td colspan='16'>port docelowy</td>
  </tr>
  <tr>
    <th>4</th>
    <td colspan='16'>długość</td>
    <td colspan='16'>suma kontrolna</td>
  </tr>
  <tr>
    <th>8</th>
    <td colspan='8'><code>G</code></td>
    <td colspan='8'><code>E</code></td>
    <td colspan='8'><code>T</code></td>
    <td colspan='8'><code> </code></td>
  </tr>
  <tr>
    <th>12</th>
    <td colspan='8'><code>/</code></td>
    <td colspan='8'><code> </code></td>
    <td colspan='8'><code>H</code></td>
    <td colspan='8'><code>T</code></td>
  </tr>
  <tr>
    <th>16</th>
    <td colspan='8'><code>T</code></td>
    <td colspan='8'><code>P</code></td>
    <td colspan='8'><code>/</code></td>
    <td colspan='8'><code>1</code></td>
  </tr>
  <tr>
    <th>20</th>
    <td colspan='8'><code>.</code></td>
    <td colspan='8'><code>1</code></td>
    <td colspan='8'><code>␍</code></td>
    <td colspan='8'><code>␊</code></td>
  </tr>
</table>

* (w praktyce HTTP prawie zawsze używa TCP)

* długość pakietu: do 65&nbsp;535 oktetów

* w IPv4 to do 65&nbsp;507 oktetów danych<br />(28 oktetów nagłówków)

Note:

Datagramy UDP służą do bezpotwierdzeniowej (tzw. _fire and forget_)
komunikacji między hostami. W praktyce protokół HTTP prawie zawsze używa
TCP, ale UDP jest stosowane przez protokół rozwiązywania nazw domenowych
(DNS) oraz, od niedawna, przez protokół QUIC stosowany w HTTP 2.0.


<table>
  <caption>pakiet TCP</caption>
  <tr>
    <th style='border: none'></th>
    <th colspan='8' width='22%'>0</th>
    <th colspan='8' width='22%'>1</th>
    <th colspan='8' width='22%'>2</th>
    <th colspan='8' width='22%'>3</th>
  </tr>
  <tr>
    <th>0</th>
    <td colspan='16'>port źródłowy</td>
    <td colspan='16'>port docelowy</td>
  </tr>
  <tr>
    <th>4</th>
    <td colspan='32'>numer sekwencji</td>
  </tr>
  <tr>
    <th>8</th>
    <td colspan='32'>numer potwierdzenia (jeśli ACK)</td>
  </tr>
  <tr>
    <th>12</th>
    <td colspan='4'>offset</td>
    <td colspan='3'>000</td>
    <td>NS</td>
    <td colspan='8'>flagi</td>
    <td colspan='16'>wielkość okna</td>
  </tr>
  <tr>
    <th>16</th>
    <td colspan='16'>suma kontrolna</td>
    <td colspan='16'>wskaźnik pilności (jeśli URG)</td>
  </tr>
  <tr>
    <th>20+</th>
    <td colspan='32'>opcje (jeśli offset danych > 5) + padding zerami</td>
  </tr>
  <tr>
    <th>20+</th>
    <td colspan='8'><code>G</code></td>
    <td colspan='8'><code>E</code></td>
    <td colspan='8'><code>T</code></td>
    <td colspan='8'><code> </code></td>
  </tr>
  <tr>
    <th>24+</th>
    <td colspan='8'><code>/</code></td>
    <td colspan='8'><code> </code></td>
    <td colspan='8'><code>H</code></td>
    <td colspan='8'><code>T</code></td>
  </tr>
  <tr>
    <th>28+</th>
    <td colspan='8'><code>T</code></td>
    <td colspan='8'><code>P</code></td>
    <td colspan='8'><code>/</code></td>
    <td colspan='8'><code>1</code></td>
  </tr>
  <tr>
    <th>32+</th>
    <td colspan='8'><code>.</code></td>
    <td colspan='8'><code>1</code></td>
    <td colspan='8'><code>␍</code></td>
    <td colspan='8'><code>␊</code></td>
  </tr>
</table>

* offset: 5-15 słów nagł. → do 40 oktetów opcji<br />
flagi: CWR, ECE, URG, ACK, PSH, RST, SYN, FIN<br />
długość danych: do 1460 oktetów

Note:

Pakiety TCP służą do zestawiania niezawodnego (_reliable_) połączenia
między dwoma hostami. Poszczególne pola oznaczają:

<ul>
  <li>numer sekwencji: jeśli SYN, to numer początkowy; pierwszy pakiet danych zwiększa numer sekwencji o 1;</li>
  <li>numer potwierdzenia: jeśli ACK, to następny spodziewany numer sekwencji; oznacza akceptację wszystkich poprzednich pakietów;</li>
  <li>offset danych: wielkość nagłówków pakietu;</li>
  <li>Explicit Congestion Notification: negocjacja szybkości bez zrzucania pakietów;</li>
  <li>NS: ECN-nonce concealment protection</li>
  <li>flagi: CWR: Congestion Window Reduced + ECE: ECN-Echo (jeśli SYN, to ECN-capable; jeśli nie SYN, to pakiet z flagą Congestion Experienced w IP) + URG: pole Urgent jest znaczące + ACK: pole Acknowledgement jest znaczące (wszystkie pakiety poza SYN powinny to mieć) + <li>PSH: push notification („popchnij” dane do aplikacji) + RST: reset połączenia + SYN: synchronizacja (tylko pierwszy pakiet z każdej strony powinien mieć tę flagę) + FIN: koniec połączenia, ostatni pakiet;</li>
  <li>wielkość okna: liczba pakietów, które wysyłający chciałby otrzymać bez potwierdzenia;</li>
  <li>wskaźnik pilności: offset numeru sekwencji oznaczający ostatni bajt pilnych danych;</li>
  <li>opcje: Option-Kind (1 oktet), Option-Length (1 oktet), Option-Data (różnie); 0x00 end-of-options; 0x01 no-op; option-size: długość całości (np. 0x04 dla dwóch oktetów danych).</li>
</ul>


<table>
  <caption>pakiet IPv4</caption>
  <tr>
    <th style='border: none'></th>
    <th colspan='8' style='width: 20%'>0</th>
    <th colspan='8' style='width: 20%'>1</th>
    <th colspan='8' style='width: 20%'>2</th>
    <th colspan='8' style='width: 20%'>3</th>
  </tr>
  <tr>
    <th>0</th>
    <td colspan='4'>wersja</td>
    <td colspan='4'>IHL</td>
    <td colspan='6'>DSCP</td>
    <td colspan='2'>ECN</td>
    <td colspan='16'>długość całkowita</td>
  </tr>
  <tr>
    <th>4</th>
    <td colspan='16'>identyfikacja</td>
    <td colspan='3'>flagi</td>
    <td colspan='13'>offset fragmentu</td>
  </tr>
  <tr>
    <th>8</th>
    <td colspan='8'>TTL</td>
    <td colspan='8'>protokół</td>
    <td colspan='16'>suma kontrolna</td>
  </tr>
  <tr>
    <th>12</th>
    <td colspan='32'>adres źródłowy</td>
  </tr>
  <tr>
    <th>16</th>
    <td colspan='32'>adres docelowy</td>
  </tr>
    <tr>
    <th>20+</th>
    <td colspan='32'>opcje (jeśli IHL > 5)</td>
  </tr>
  <tr>
    <th>20+</th>
    <td colspan='32'>dane (np. pakiet TCP)</td>
  </tr>
</table>

Note:

Pakiety IP służą do przekazywania danych (w tym np. datagramów UDP
czy pakietów TCP) między dwoma hostami. Poszczególne pola oznaczają:

<ul>
  <li>wersja: 4;</li>
  <li>Internet Header Length: w słowach, min. 5, max. 15 (bo cztery bity);</li>
  <li>Differentiated Services Code Point: rozróżnienie nowych technologii, np. VoIP;</li>
  <li>Explicit Congestion Notification: kontrola zatłoczenia ruchu (można ignorować i gubić pakiety);</li>
  <li>długość całkowita: w oktetach, 20-65545;</li>
  <li>identyfikacja fragmentów jednego datagramu;</li>
  <li>flagi: 0, don’t fragment (zgub jeśli musisz sfragmentować), more fragments;</li>
  <li>offset fragmentu: 13 bitów, liczba 8-oktetowych bloków, offset w stosunku do początku datagramu;</li>
  <li>Time To Live: ile sekund (w praktyce: ile hopów), zabezpieczenie przed pętlami w ruchu;</li>
  <li>protokół: Internet Control Message Protocol (np. błędy, ale i ping), TCP, UDP…;</li>
  <li>opcje (jeśli IHL > 5): rzadko używane.</li>
</ul>


<table>
  <caption>pakiet IPv6 (o stałym nagłówku)</caption>
  <tr>
    <th style='border: none'></th>
    <th colspan='8' style='width: 20%'>0</th>
    <th colspan='8' style='width: 20%'>1</th>
    <th colspan='8' style='width: 20%'>2</th>
    <th colspan='8' style='width: 20%'>3</th>
  </tr>
  <tr>
    <th>0</th>
    <td colspan='4'>wersja</td>
    <td colspan='8'>klasa ruchu</td>
    <td colspan='20'>etykieta ruchu</td>
  </tr>
  <tr>
    <th>4</th>
    <td colspan='16'>długość danych</td>
    <td colspan='8'>następny nagłówek</td>
    <td colspan='8'>limit skoków</td>
  </tr>
  <tr>
    <th>8</th>
    <td colspan='32' rowspan='4'>adres źródłowy</td>
  </tr>
  <tr><th>12</th></tr>
  <tr><th>16</th></tr>
  <tr><th>20</th></tr>
  <tr>
    <th>24</th>
    <td colspan='32' rowspan='4'>adres docelowy</td>
  </tr>
  <tr><th>28</th></tr>
  <tr><th>32</th></tr>
  <tr><th>36</th></tr>
  <tr>
    <th>38+</th>
    <td colspan='32'>dane (np. pakiet TCP)</td>
  </tr>
</table>

Note:

Pakiet nowej wersji protokołu IP. Istotne różnice w stosunku do IPv4:

<ul>
  <li>wersja: 6;</li>
  <li>klasa ruchu: 6 bitów rozróżniania usług, 2 bity ECN;</li>
  <li>etykieta ruchu: wysyłanie pakietów np. streamu jedną trasą;</li>
  <li>długość danych: w oktetach;</li>
  <li>następny nagłówek: typ następnego nagłówka; to samo co protokół w IPv4;</li>
  <li>limit skoków.</li>
</ul>


<table>
  <caption>ramka Ethernet</caption>
  <tr>
    <th style='border: none'></th>
    <th style='width: 20%'>0</th>
    <th style='width: 20%'>1</th>
    <th style='width: 20%'>2</th>
    <th style='width: 20%'>3</th>
  </tr>
  <tr>
    <th>0</th>
    <td>`10101010`</td>
    <td>`10101010`</td>
    <td>`10101010`</td>
    <td>`10101010`</td>
  </tr>
  <tr>
    <th>4</th>
    <td>`10101010`</td>
    <td>`10101010`</td>
    <td>`10101010`</td>
    <td>`10101011`</td>
  </tr>
  <tr>
    <th>8</th>
    <td colspan='4'>adres docelowy…</td>
  </tr>
  <tr>
    <th>12</th>
    <td colspan='2'>…adres docelowy</td>
    <td colspan='2'>adres źródłowy…</td>
  </tr>
  <tr>
    <th>16</th>
    <td colspan='4'>…adres źródłowy</td>
  </tr>
  <tr>
    <th>20</th>
    <td colspan='2'>typ lub długość</td>
    <td colspan='2'>dane…</td>
  </tr>
  <tr>
    <th>24+</th>
    <td colspan='4'>…dane: 46-1500 oktetów (np. pakiet IP)</td>
  </tr>
  <tr>
    <th>68+</th>
    <td colspan='4'>suma kontrolna</td>
  </tr>
  <tr>
    <th>72+</th>
    <td colspan='4'>przerwa międzyramkowa…</td>
  </tr>
  <tr>
    <th>76+</th>
    <td colspan='4'>…przerwa międzyramkowa…</td>
  </tr>
  <tr>
    <th>80+</th>
    <td colspan='4'>…przerwa międzyramkowa</td>
  </tr>
</table>

Note:

Ramka Ethernet to ramka warstwy łącza danych: ma bardzo prostą
konstrukcję, na szczególną uwagę zasługuje sekwencja treningowa
(pozwalająca wyliczyć sygnał zegarowy w medium oraz pole typ lub
długość: długość jeśli ma wartość ≤1500, typ (np. IPv4) jeśli więcej.


## warstwa fizyczna

* bity przesyłane w medium

* np. zakodowane kodem Manchester

![Manchester](img/manchester.svg)

Note:

W kodzie Manchester występuje kodowanie fazowe, w którym dane podlegają
operacji XOR (alternatywa wykluczająca) z sygnałem zegara – to
oznacza, że z odebranego sygnału da się odtworzyć taktowanie zegara.

Jeśli dane to naprzemienne zera i jedynki (jak w sekwencji
treningowej ramki Ethernet), to odebrany sygnał jest
de facto przesuniętym o pół fazy sygnałem zegarowym.
