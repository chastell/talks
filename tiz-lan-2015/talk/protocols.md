# protokoły


## ALOHAnet (1971)

* Hawaje: siedem komputerów na czterech wyspach

* topologia szyny: wspólne medium, łączone przez satelitę

* nadawanie w dowolnym momencie (pure)<br />lub
  w&nbsp;takt zegara (slotted) + potwierdzenie odbioru

Note:

transponder na satelicie geostracjonarnym łączy komputery z centralnym

brak potwierdzenia w przypadku zniekształconej
ramki, retransmisja w losowym czasie

węzeł centralny: Menehune


<table>
  <caption>ramka ALOHAnet</caption>
  <tr>
    <th style='border: none'></th>
    <th style='width: 20%'>0</th>
    <th style='width: 20%'>1</th>
    <th style='width: 20%'>2</th>
    <th style='width: 20%'>3</th>
  </tr>
  <tr>
    <th>0</th>
    <td colspan='4'>nagłówek</td>
  </tr>
  <tr>
    <th>4</th>
    <td colspan='2'>suma kontrolna</td>
    <td colspan='2'>dane…</td>
  </tr>
  <tr>
    <th>8</th>
    <td colspan='4'>…dane…</td>
  </tr>
  <tr>
    <th>…</th>
    <td colspan='4'>…dane…</td>
  </tr>
  <tr>
    <th>84</th>
    <td colspan='2'>…dane</td>
    <td colspan='2'>suma kontrolna</td>
  </tr>
</table>

* do 80 oktetów danych

Note:

nagłówek zawiera adres docelowy; tylko odbiorca go odbierze

sumy kontrolne osobno nagłówków i danych


![Pure ALOHA](img/aloha_pure.svg)

[ALOHAnet](http://en.wikipedia.org/wiki/ALOHAnet)


![Slotted ALOHA](img/aloha_slotted.svg)

[ALOHAnet](http://en.wikipedia.org/wiki/ALOHAnet)


![ALOHA comparison](img/aloha_comparison.svg)

[ALOHAnet](http://en.wikipedia.org/wiki/ALOHAnet)


## Ethernet (1973)

* 1973: początek prac w PARC
* 1976: Metcalfe, Boggs: _Ethernet: Distributed<br />
  Packet Switching for Local Computer Networks_
* 1980: DIX (DEC, Intel, Xerox)
* 1982: DIX Ethernet II
* 1983: IEEE 802.3 (CSMA/CD)
* 1985: Fat Ethernet (10 Mbit/s)
* 1995: 802.3u Fast Ethernet (100 Mbit/s)
* 1998: 802.3z Gigabit Ethernet (1000 Mbit/s)


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

* 84-1538 oktetów (64–1518 oktetów treści)

Note:

preambuła w kodzie Manchester: zegar

przerwa międzyramkowa: czas, by urządzenia doszły do
siebie; minimum czas 96 bitów: 9,6 µs w 10 Mbit/s, 0,96
µs w 100 Mbit/s FastE, 0,096 µs w GigE, 0,0096 µs w 10GigE

przy odbiorze może być mniejsza, bo opóźnienia w sieci, tolerancja
zegarów, repeatery: 10GigE: 40 bit (5 oktetów), GigE 64 bit (8
oktetów), FastE nie ma limitu, zwykle 12 oktetów, Etherne 47 bitów


<table>
  <caption>ramka Ethernet z tagiem 802.1Q</caption>
  <tr>
    <th style='border: none'></th>
    <th width='20%'>0</th>
    <th width='20%'>1</th>
    <th width='20%'>2</th>
    <th width='20%'>3</th>
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
    <td colspan='4'>tag 802.1Q</td>
  </tr>
  <tr>
    <th>24</th>
    <td colspan='2'>typ lub długość</td>
    <td colspan='2'>dane…</td>
  </tr>
  <tr>
    <th>28+</th>
    <td colspan='4'>…dane: 42-1500 oktetów (np. pakiet IP)</td>
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

* 84-1542 oktety (64-1522 oktety treści)

Note:

VLAN: jeśli część sieci (mostek, switch) jest VLAN-aware, to
może to odpowiednio routować; VLAN-unaware mają to zdejmowane

pierwszy oktet to 0x8100, żeby był EtherType VLAN

Priority Code Point: 3 bity priorytetu (np. do usług głosowych)

Drop Eligible Indicator: 1 bit mówiący, że
można ten pakiet zgubić (można razem z PCP)

VLAN Identifier: 12 bitów mówiących o tym, który
to wirtualny LAN (0x000 i 0xfff zarezerwowane)

przeliczenie sumy kontrolnej


| wartość (hex) | znaczenie    |
|--------------:|:------------:|
| ≤ 05DC        | długość      |
| 0800          | IPv4         |
| 0805          | X.25         |
| 0806          | ARP          |
| 0842          | Wake-on-LAN  |
| 6003          | DECnet       |
| 8035          | RARP         |
| 809B          | AppleTalk    |
| 80F3          | AARP         |
| 8100          | 802.1Q tag   |
| 8137          | IPX          |
| 8138          | IPX          |
| 86DD          | IPv6         |
| 8808          | flow control |
| 8870          | jumbo frame  |

Note:

AARP: AppleTalk Address Resolution Protocol

IPX: Internetwork Packet Exchange (Novell)

flow control: ograniczanie szybkiego
nadawcy przed zadławieniem wolnego odbiorcy

jumbo frame: ramka > 1500 oktetów (do 9000)


## adres MAC

* sześć oktetów

* trzy oktety Organisationally Unique Identifier

* trzy oktety Network Interface Controller

* `12-34-56-78-9A-BC`

* IEEE 802.3 + 802.4 najpierw LSB:<br />`01001000 00101100 01101010`<br />`00011110 01011001 00111101`

* IEEE 802.5 + 802.6 najpierw MSB:<br />`00010010 00110100 01010110`<br />`01111000 10011010 10111100`

Note:

802.3: Ethernet, 802.4 Token Bus, 802.5 Token Ring, 802.6 FDDI (MAN)


## ARCNET (1976)

* mikrokomputery → systemy wbudowane

* RFC 1051 → RFC 1201: IP/ARP po ARCNET

* ramki: krótka, długa, wyjątku

Note:

do 600 metrów (thinnet do 200/180 m)

przekazywanie tokena

ramki: 256 oktetów (0-249 danych), 512 oktetów
(253-504 danych) i wyjątku (250-252 danych)


## Token Ring (1985)

* IEEE 802.5

* topologia pierścienia (logiczna)

* token – trzyoktetowa ramka krążąca między hostami:<br />
  flaga początku + pole sterujące + flaga końca

* nadawanie: zamiana tokena na na ramkę danych

* odbieranie: zamiana ramki danych na token


<table>
  <caption>ramka danych Token Ring</caption>
  <tr>
    <th style='border: none'></th>
    <th style='width: 20%'>0</th>
    <th style='width: 20%'>1</th>
    <th style='width: 20%'>2</th>
    <th style='width: 20%'>3</th>
  </tr>
  <tr>
    <th>0</th>
    <td>flaga początku</td>
    <td>pole sterujące</td>
    <td>pole ramki</td>
    <td>adres docelowy…</td>
  </tr>
  <tr>
    <th>4</th>
    <td colspan='4'>…adres docelowy…</td>
  </tr>
  <tr>
    <th>8</th>
    <td>…adres docelowy</td>
    <td colspan='3'>adres źródłowy…</td>
  </tr>
  <tr>
    <th>12</th>
    <td colspan='3'>…adres źródłowy</td>
    <td>dane…</td>
  </tr>
  <tr>
    <th>…</th>
    <td colspan='4'>…dane (do 18 200 oktetów)</td>
  </tr>
  <tr>
    <th>…</th>
    <td colspan='4'>suma kontrolna</td>
  </tr>
  <tr>
    <th>…</th>
    <td>flaga końca</td>
    <td>status ramki</td>
    <td colspan='2'></td>
  </tr>
</table>

Note:

krąży ramka z tokenem; gdy stacja chce nadawać, zamienia na ramkę danych

specjalna stacja kontroluje, czy jest dobra liczba
tokenów – jeden w 4 Mbit/s i wiele w 16 Mbit/s

priorytety: stacja może podbić priotyet tokena,
token robi rundkę, stacja transmistuje i zmniejsza

flaga początku: JK0JK000 (J, K: specjalnie
błędne kody, np. całe 0 w Manchesterze)

pole sterujące: PPPTMRRR: 3 bity priorytetu, 1 bit czy token,
1 bit stacji monitorującej (ustawia gdy widzi) i 3 bity zarezerwowane

pole ramki: czy to ramka danych, czy kontroli; 2 bity typu i 6 bitów kontroli

flaga końca: JK1JK1IE (Intermediate frame, Error bit)

status ramki: AC00AC00: czy rozpoznana i skopiowana
przez adresata (Address recognised, frame Copied)


## Token Bus

* IEEE 802.4

* Token Ring po wirtualnym pierścienu<br />na kablu koncentrycznym

* topologia szyny

* broadband (w Ethernecie baseband)

* token przekazywany z malejącymi adresami MAC


## FDDI (1986)

* Fiber Distributed Data Interface

* na miedzi: CDDI / TP-DDI

* topologia podwójnego pierścienia (logiczna)

* protokół pochodzący od Token Bus


<table>
  <caption>ramka FDDI</caption>
  <tr>
    <th style='border: none'></th>
    <th style='width: 20%'>0</th>
    <th style='width: 20%'>1</th>
    <th style='width: 20%'>2</th>
    <th style='width: 20%'>3</th>
  </tr>
  <tr>
    <th>0</th>
    <td colspan='2'>preambuła</td>
    <td>flaga początku</td>
    <td>pole sterujące</td>
  </tr>
  <tr>
    <th>4</th>
    <td colspan='4'>adres docelowy…</td>
  </tr>
  <tr>
    <th>8</th>
    <td colspan='2'>…adres docelowy</td>
    <td colspan='2'>adres źródłowy…</td>
  </tr>
  <tr>
    <th>12</th>
    <td colspan='4'>…adres źródłowy</td>
  </tr>
  <tr>
    <th>16</th>
    <td colspan='4'>dane (do 4478 oktetów)…</td>
  </tr>
  <tr>
    <th>…</th>
    <td colspan='4'>suma kontrolna</td>
  </tr>
  <tr>
    <th>…</th>
    <td>flaga końca</td>
    <td>status ramki</td>
    <td colspan='2'></td>
  </tr>
</table>


## IEEE 802.11 (1997)

* WiFi

* wspólne medium, topologia szyny

* tryb infrastrukturalny<br />(z punktami dostępowymi)

* tryb ad-hoc<br />(bez punktu dostępowego)

* warstwy MAC i PHY

Note:

Basic Service Set + BSSID: local / independent


| rok  | standard | pasmo        | prędkość       |
|------|----------|--------------|----------------|
| 1997 | 802.11   | 2,4 GHz      | do 2 Mbit/s    |
| 1999 | 802.11a  | 5 GHz        | do 54 Mbit/s   |
| 1999 | 802.11b  | 2,4 GHz      | do 11 Mbit/s   |
| 2003 | 802.11g  | 2,4 GHz      | do 54 Mbit/s   |
| 2009 | 802.11n  | 2,4/5 GHz    | do 72,2 Mbit/s (20&nbsp;MHz),<br />do 150&nbsp;Mbit/s (40 MHz) |
| 2012 | 802.11ac | 5 GHz        | do 87,6 MBit/s (20&nbsp;MHz),<br />do 866,7&nbsp;Mbit/s (160 MHz) |
| 2014 | 802.11ad | 2,4/5/60 GHz | do 6912 MBit/s |


<dl>
  <dt>Frequency Hopping Spread Spectrum (802.11)</dt>
  <dd>pseudolosowe (znane nadawcy i odbiorcy)<br />skakanie po częstotliwościach</dd>

  <dt>Direct Sequence Spread Spectrum<br />(802.11, 802.11b, 802.11g)</dt>
  <dd>modulacja fazy szybkozmiennym pseudoszumem<br />(znanym nadawcy i odbiorcy)</dd>

  <dt>Orthogonal Frequency Division Multiplexing<br />(802.11a, 802.11g, 802.11n, 802.11ac)</dt>
  <dd>transmisja wielu strumieni na<br />ortogonalnych częstotliwościach</dd>
</dl>

Note:

modulacje spread-spectrum: więcej pasma (zamiast na
jednej częstotliwości – na wielu), żeby mniej zakłóceń
wąskopasmowych; żeby trudnej przechwycić; żeby dodawać
minimalny szum do wąskopasmowych (i vice versa)

DSSS: modulacja „chipami” o dużo krótszym czasie niż bit informacji;
ciąg pseudolosowych 1 i -1, przez które mnożony jest sygnał na
obu końcach (na drugim to odtwarza sygnał); odporność na jamming,
podział jednego kanału wśród wielu użytkowników, trudniejsze
przechwytywanie (mniejszy stosunek sygnału do szumu tła)

OFDM: na blisko położonych podnośnych przesyłanych jest kilka
strumieni danych; każda podnośna modulowana jest konwencjonalnie
(QAM, PSK) przy wolnej zmienności symboli, przez co cała szybkość
przenoszenia danych jest podobna; odporność na zakłócenia


![channels](img/channels.svg)

[IEEE 802.11](http://en.wikipedia.org/wiki/IEEE_802.11)

* wybrane kanały w paśmie 2,4 GHz

* dostępność kanałów w zależności od regulacji krajowych

Note:

DSSS: kanały 22 MHz: 1, 6, 11, 14

OFDM: kanały 20 MHz: 1, 6, 11

OFDM: kanały 40 MHz: 3

dostępność: 1-11 wszędzie; 12-13 wszędzie poza USA (tam
low-power); 14 tylko Japonia i tylko DSSS (802.11b),
nie OFDM (802.11g); 1-4 w Izraelu tylko we wnętrzach


<table>
  <caption>ramka MAC IEEE 802.11</caption>
  <tr>
    <th style='border: none'></th>
    <th style='width: 20%'>0</th>
    <th style='width: 20%'>1</th>
    <th style='width: 20%'>2</th>
    <th style='width: 20%'>3</th>
  </tr>
  <tr>
    <th>0</th>
    <td colspan='2'>pola kontrolne</td>
    <td colspan='2'>czas trwania/ID</td>
  </tr>
  <tr>
    <th>4</th>
    <td colspan='4'>adres 1…</td>
  </tr>
  <tr>
    <th>8</th>
    <td colspan='2'>…adres 1</td>
    <td colspan='2'>adres 2…</td>
  </tr>
  <tr>
    <th>12</th>
    <td colspan='4'>…adres 2</td>
  </tr>
  <tr>
    <th>16</th>
    <td colspan='4'>adres 3…</td>
  </tr>
  <tr>
    <th>20</th>
    <td colspan='2'>…adres 3</td>
    <td colspan='2'>kontrola sekwencji</td>
  </tr>
  <tr>
    <th>24</th>
    <td colspan='4'>adres 4…</td>
  </tr>
  <tr>
    <th>28</th>
    <td colspan='2'>…adres 4</td>
    <td colspan='2'>dane…</td>
  </tr>
    <th>…</th>
    <td colspan='4'>…dane (do 2312 oktetów, w tym 8 WEP)</td>
  </tr>
  <tr>
    <th>…</th>
    <td colspan='4'>suma kontrolna</td>
  </tr>
</table>

<aside class='notes'>

<p>pola kontrolne: 2 bity wersji (00), 2 bity typu
(control/data/management), 4 bity podtypu, ToDS+FromDS:
po 1 bicie czy do/z systemu dystrybucji (control, management:
00, reszta poza IBSS 01 albo 10), 1 bit More Fragments,
1 bit czy to Retry, 1 bit że włączam power saver (na koniec
wymiany, AP zawsze 0), 1 bit More Data (więc nie zasypiaj),
1 bit czy WEP (1: odszyfrowany), 1 bit czy zachowana kolejność</p>

<p>czas trwania/ID: czas trwania (siedem bitów w mikrosekundach
i 0), contention-free period (00000001), gdy się wybudzają ze
snu to ramka PS-Poll: Association ID + 00</p>

<p>adresy: destination (może być eth), source, receiver (= destination
jeśli jest wifi a nie eth), transmitter (używany w wifi bridging)</p>

<p>kontrola sekwencji: w jakiej kolejności i usuwanie
duplikatów – 4 bity fragmentacji + 12 bitów sekwencji</p>

</aside>
