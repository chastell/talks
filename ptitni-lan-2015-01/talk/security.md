# bezpieczeństwo w&nbsp;sieciach

Note: 9:58

użytkownik WiFi spoza sieci; cash@square.com


## Ethernet

* możliwość nasłuchiwania<br />ruchu w segmencie sieci

* tryb promiscuous: odbiór przez kartę sieciową<br />
wszystkich pakietów (nie zawsze dostępny)

* budowanie statystyk ruchu

* możliwość wybudzania maszyn<br />za pomocą Wake-on-LAN

Note: 10:03

Firesheep

Wireshark


## szyfrowanie ruchu w&nbsp;warstwach

* certyfikaty X.509

* Secure Socket Layer

* Transport Layer Security

* Secure Shell

* IPsec

Note: 10:07

X.509: standard kryptografii klucza publicznego: certyfikaty
kluczy publicznych, listy odwołanych certyfikatów,
certyfikaty atrybutu, algorytm ścieżki walidacji certyfikatu

SSL: poprzednik TLS; kryptograficzne
protokoły szyfrowania ruchu w Internecie

model TCP/IP: podwarstwa warstwy aplikacji; model OSI:
inicjalizowane w warstwie 5 (sesji), pracują w 6 (prezentacji)

SSH: zamiast niezaszyfrowanego telnetu, rsh, rexeca

IPsec: uwierzytelnianie i szyfrowanie każdego pakietu IP; warstwa
Internetu; bez IPsec to warstwa aplikacji musi się martwić o TLS

protecting data flows between a pair of hosts (host-to-host),
between a pair of security gateways (network-to-network), or
between a security gateway and a host (network-to-host)


## Wired Equivalent Privacy

* Open System Authentication: brak klucza

* Shared Key Authentication: tajny klucz

* klucz RC4, 64 bity (40 faktycznych bitów)

* (wiadomość + CRC) XOR RC4(IV, klucz)

* wysyłane IV i szyfrogram

Note: 10:15

WiFi: kiepska poufność, niekryptograficzna integralność, marne
uwierzytelnianie, brak kontroli dostępu i zarządzania kluczami krypto

WEP: siła w tajności klucza, samosynchronizacja
algorytmu bo duża BER, efektywność w sprzęcie
i oprogramowaniu, eksportowalność poza USA, opcjonalność

nadawca i odbiorca dzielą tajny klucz

WEP: klucz 40/104 b + 24 b wektor inicjalizujący → 64/128 b do RC4

40 b: pięć znaków ASCII (ale to b. zmniejsza przestrzeń,
bo tylko drukowalne), więc lepiej 10 znaków hex

104 b: 26 znaków hex; ew. 13 znaków ASCII

OSA > SKA, bo z SKA można wywnioskować klucz!

OSA+SKA: uwierzytelnianie; SKA: wymiana klucza przez
wyzwanie-odpowiedź, przeważnie nieimplementowany

RC4: można zaatakować jeśli zna się początek, a to w WEP-ie ma miejsce

2013: podejrzenia, że agencje USA potrafią
łamać RC4; Microsoft zaleca wyłączenie

Aircrack


<table>
  <caption>ramka WEP</caption>
  <tr>
    <th style='width: 20%'>0</th>
    <th style='width: 20%'>1</th>
    <th style='width: 20%'>2</th>
    <th style='width: 20%'>3</th>
  </tr>
  <tr>
    <td colspan='4'>nagłówek</td>
  </tr>
  <tr>
    <td colspan='3'>IV</td>
    <td>numer klucza</td>
  </tr>
  <tr>
    <td colspan='4'>SNAP…</td>
  </tr>
  <tr>
    <td colspan='2'>…SNAP</td>
    <td colspan='2'>ID protokołu</td>
  </tr>
  <tr>
    <td colspan='4'>dane…</td>
  </tr>
  <tr>
    <td colspan='4'>suma kontrolna</td>
  </tr>
</table>

Note: 10:17

błąd: nagłówek ma 30 oktetów, nie 8

nagłówek ma 12 oktetów, nie 8: 2 kontrola
ramki, 2 czas trwania, 6 BSSID, 6 source address,
6 destination address, 2 fragment/sequence number

numer klucza: 6 b pad, 2 b key ID

od Subnetwork Access Protocol do sumy kontrolnej: zaszyfrowane

SNAP[0] = 0xAA zawsze!


## <span style='font-family: Ubuntu, serif'>IEEE 802.11i</span>

* WPA: Wi-Fi Protected Access

* WPA2 (IEEE 802.11i-2004)

* WPA-Personal / WPA-Enterprise

* TKIP (Temporal Key Integrity Protocol):<br />dodaktowy
komponent obok WEP;<br />tymczasowy – dla istniejących urządzeń

* CCMP (Counter Mode Cipher Block Chaining Message Authentication
Code Protocol): bazujący na AES; długoterminowy – dla nowych urządzeń

* Extensible Authentication Protocol

<aside class='notes'>
<p>10:20</p>

<p>WPA: tymczasowe, w oczekiwaniu na WPA2</p>

<p>WPA: TKIP, WPA2: CCMP</p>

<p>TKIP może być zaimplementowany
programowo, wykorzystuje sprzętowy WEP</p>

<p>TKIP: klucz per pakiet</p>

<p>TKIP: 128 b klucz szyfrujący (ten sam dla AP i klientów);
64 b klucz integralności (różne dla AP i klientów)</p>

<p>CCMP: Advanced Encryption Standard wymaga
wydajnego sprzętu (i AP i klientów)</p>

<p>WPA: atak możliwy, bo są tablice tęczowe dla
najbardziej znanych SSID-ów – linksys: 2,5%, (brak):
2,0%, NETGEAR: 1,1%, default: 0,6%, dlink: 0,6%</p>

</aside>
