# jak to działa (w&nbsp;praktyce)


```
$ dig www.tiz.tele.pw.edu.pl

; <<>> DiG 9.9.5-3-Ubuntu <<>> www.tiz.tele.pw.edu.pl
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 5496
;; flags: qr rd ra; QUERY: 1, ANSWER: 2, AUTHORITY: 0, ADDITIONAL: 0

;; QUESTION SECTION:
;www.tiz.tele.pw.edu.pl.		IN	A

;; ANSWER SECTION:
www.tiz.tele.pw.edu.pl.	86396	IN	CNAME	sagittarius.tele.pw.edu.pl.
sagittarius.tele.pw.edu.pl. 86396 IN	A	194.29.169.134

;; Query time: 54 msec
;; SERVER: 127.0.1.1#53(127.0.1.1)
;; WHEN: Thu Nov 27 10:12:51 CET 2014
;; MSG SIZE  rcvd: 82
```

Note: 11:56


```
$ curl -v www.tiz.tele.pw.edu.pl
* Rebuilt URL to: www.tiz.tele.pw.edu.pl/
* Hostname was NOT found in DNS cache
*   Trying 194.29.169.134...
* Connected to www.tiz.tele.pw.edu.pl (194.29.169.134) port 80 (#0)
> GET / HTTP/1.1
> User-Agent: curl/7.35.0
> Host: www.tiz.tele.pw.edu.pl
> Accept: */*
> 
< HTTP/1.1 301 Moved Permanently
< Date: Thu, 27 Nov 2014 09:13:27 GMT
* Server Apache/2.2.16 (Debian) is not blacklisted
< Server: Apache/2.2.16 (Debian)
< Location: https://www.tiz.tele.pw.edu.pl
< Vary: Accept-Encoding
< Content-Length: 326
< Content-Type: text/html; charset=iso-8859-1
< 
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html><head>
<title>301 Moved Permanently</title>
</head><body>
<h1>Moved Permanently</h1>
<p>The document has moved <a href="https://www.tiz.tele.pw.edu.pl">here</a>.</p>
<hr>
<address>Apache/2.2.16 (Debian) Server at www.tiz.tele.pw.edu.pl Port 80</address>
</body></html>
* Connection #0 to host www.tiz.tele.pw.edu.pl left intact
```


```
$ curl -v https://www.tiz.tele.pw.edu.pl
* Rebuilt URL to: https://www.tiz.tele.pw.edu.pl/
* Hostname was NOT found in DNS cache
*   Trying 194.29.169.134...
* Connected to www.tiz.tele.pw.edu.pl (194.29.169.134) port 443 (#0)
* successfully set certificate verify locations:
*   CAfile: none
  CApath: /etc/ssl/certs
* SSLv3, TLS handshake, Client hello (1):
* SSLv3, TLS handshake, Server hello (2):
* SSLv3, TLS handshake, CERT (11):
* SSLv3, TLS handshake, Server key exchange (12):
* SSLv3, TLS handshake, Server finished (14):
* SSLv3, TLS handshake, Client key exchange (16):
* SSLv3, TLS change cipher, Client hello (1):
* SSLv3, TLS handshake, Finished (20):
* SSLv3, TLS change cipher, Client hello (1):
* SSLv3, TLS handshake, Finished (20):
* SSL connection using DHE-RSA-AES256-SHA
* Server certificate:
* 	 subject: C=PL; OU=Domain Control Validated; CN=www.tiz.tele.pw.edu.pl
* 	 start date: 2014-06-25 10:18:29 GMT
* 	 expire date: 2015-06-26 10:18:29 GMT
* 	 subjectAltName: www.tiz.tele.pw.edu.pl matched
* 	 issuer: O=AlphaSSL; CN=AlphaSSL CA - G2
* 	 SSL certificate verify ok.
> GET / HTTP/1.1
> User-Agent: curl/7.35.0
> Host: www.tiz.tele.pw.edu.pl
> Accept: */*
> 
< HTTP/1.1 200 OK
< Date: Thu, 27 Nov 2014 09:14:13 GMT
* Server Apache/2.2.16 (Debian) is not blacklisted
< Server: Apache/2.2.16 (Debian)
< X-Powered-By: PHP/5.3.3-7+squeeze22
< Set-Cookie: wassup=N2Y…; expires=Thu, 27-Nov-2014 10:04:14 GMT; path=/
< X-Pingback: https://www.tiz.tele.pw.edu.pl/xmlrpc.php
< Vary: Accept-Encoding
< Transfer-Encoding: chunked
< Content-Type: text/html; charset=UTF-8
< 
```


```
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" …>
<html xmlns="http://www.w3.org/1999/xhtml" lang="pl-PL" …>
…
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, …" />
<title>Studia Podyplomowe Telekomunikacja, Informatyka i Zarządzanie…</title>
…
<link rel="canonical" href="https://www.tiz.tele.pw.edu.pl" />
<meta property="og:locale" content="pl_PL" />
<meta property="og:type" content="website" />
<meta property="og:title" content="Studia Podyplomowe Telekomunikacja…" />
<meta property="og:url" content="https://www.tiz.tele.pw.edu.pl" />
<meta property="og:site_name" content="Studia Podyplomowe Telekomunikacja…" />
…
<link rel="alternate" type="application/rss+xml" …>
…
<link rel='stylesheet' …/>
…
<meta name="generator" content="Powered by Visual Composer…"/>
…
</head>
<body …>
…
<h1><a … href="https://www.tiz.tele.pw.edu.pl">Studia Podyplomowe…</a></h1>
…
<h5>Podstawowe fakty</h5>
<p>Studia Podyplomowe w zakresie Telekomunikacji, Informatyki i Zarządzania…</p>
<p>Dzięki atrakcyjnej ofercie i wysokiemu poziomowi merytorycznemu…</p>
…
</body>
</html>
* Connection #0 to host www.tiz.tele.pw.edu.pl left intact
```

Note: 12:00

nie tylko GET i POST – ale też DELETE, PUT, HEAD, PATCH, TRACE (echo,
żeby zobaczyć jak się zmieniło zapytanie po drodze) etc.; idempotentność

WebDAV: read-write medium, edycja i zarządzanie dokumentami


## UDP i TCP

* `socket()`
* `bind()`
* `listen()`
* `accept()`
* `read()` + `write()`
* `close()`

* datagramy vs połączenia

Note: 12:10


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

Note: 12:12


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

Note: 12:18

numer sekwencji: jeśli SYN, to numer początkowy; pierwszy danych to to +1

numer potwierdzenia: jeśli ACK, to następny spodziewany
numer sekwencji; akceptacja wszystkich poprzednich

offset danych: wielkość nagłówków

Explicit Congestion Notification:
negocjacja szybkości bez zrzucania pakietów

NS: ECN-nonce concealment protection

CWR: Congestion Window Reduced

ECE: ECN-Echo: jeśli SYN, to ECN-capable; jeśli nie
SYN, to pakiet z flagą Congestion Experienced w IP

URG: pole Urgent jest znaczące

ACK: pole Acknowledgement jest znaczące; wszystkie poza SYN powinny to mieć

PSH: push notification; popchnij dane do aplikacji

RST: reset połączenia

SYN: synchronizacja; tylko pierwszy pakiet z każdej strony

FIN: koniec połączenia, ostatni pakiet

wielkość okna: liczba pakietów, które wysyłający chciałby otrzymać

wskaźnik pilności: offset numeru sekwencji
oznaczający ostatni bajt pilnych danych

opcje: Option-Kind (1 oktet), Option-Length (1 oktet),
Option-Data (różnie); 0x00 end-of-options; 0x01 no-op;
option-size: długość całości (np. 0x04 dla dwóch oktetów danych)


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

Note: 12:20

wersja: 4

Internet Header Length: w słowach, min. 5, max. 15 (bo cztery bity)

Differentiated Services Code Point: rozróżnienie nowych technologii, np. VoIP

Explicit Congestion Notification: kontrola
zatłoczenia ruchu (można ignorować i gubić pakiety)

długość całkowita: w oktetach; 20-65545

identyfikacja fragmentów jednego datagramu

flagi: 0, don’t fragment (zgub jeśli musisz sfragmentować), more fragments

offset fragmentu: 13 bitów, liczba 8-oktetowych
bloków, offset w stosunku do początku datagramu

Time To Live: ile sekund (w praktyce: ile hopów); żeby nie latały w koło

protokół: Internet Control Message
Protocol (np. błędy, ale i ping), TCP, UDP

opcje (jeśli IHL > 5): rzadko używane


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

Note: 12:22

wersja: 6

klasa ruchu: 6 bitów rozróżniania usług, 2 bity ECN

etykieta ruchu: wysyłanie pakietów np. streamu jedną trasą

długość danych: w oktetach

następny nagłówek: typ następnego nagłówka; to samo co protokół w IPv4

limit skoków


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

Note: 12:25

typ lub długość: długość jeśli ≤1500, typ (np. IPv4) jeśli więcej


## warstwa fizyczna

* bity przesyłane w medium

* np. zakodowane kodem Manchester

![Manchester](img/manchester.svg)

<aside class='notes'>
  <p>12:27</p>
  <p>kodowanie fazowe; dane XOR clock; z sygnału da się odtworzyć zegar</p>
</aside>
