# model TCP/IP


## warstwy TCP/IP

<table>
  <tr>
    <th>OSI</th>
    <th>TCP/IP</th>
    <th>przykład</th>
  </tr>
  <tr>
    <td>aplikacji</td>
    <td rowspan='3'>aplikacji</td>
    <td rowspan='3'>HTTP</td>
  </tr>
  <tr>
    <td>prezentacji</td>
  </tr>
  <tr>
    <td>sesji</td>
  </tr>
  <tr>
    <td>transportowa</td>
    <td>transportowa</td>
    <td>TCP, UDP</td>
  </tr>
  <tr>
    <td>sieciowa</td>
    <td>Internetu</td>
    <td>IP</td>
  </tr>
  <tr>
    <td>łącza danych</td>
    <td rowspan='2'>dostępu do sieci</td>
    <td rowspan='2'>Ethernet</td>
  </tr>
  <tr>
    <td>fizyczna</td>
  </tr>
</table>

Note:

Model TCP/IP w pewnym stopniu pasuje do modelu OSI (jednakże
niedokładnie). Warstwa dostępu do sieci (link) łączy pojedynczy
segment sieci; warstwa Internetu łączy niezależne sieci,
warstwa transportowa zapewnia komunikację między procesami,
a warstwa aplikacji stanowi interfejs użytkownika.

Początki modelu TCP/IP miały miejsce w ARPANECIE w późnych latach 60.;
w 1973 powstała idea przerzucenia odpowiedzialności za niezawodność
na hosty, a w 1974 powstała pierwsza specyfikacja TCP. W 1975
nastąpiło stworzenie połączenia Stanford-Londyn, w 1977 USA-Wielka
Brytania-Norwegia, a w 1983 pełne przejście na TCP/IP.

Założenie modelu TCP/IP to tzw. _end-to-end_, czyli utrzymanie stanu
„na brzegach” (po stronach hostów), co umożliwia maksymalnie prostą
i szybką komunikację. Model też zakłada tzw. _robustness_ (krzepkość?):
bycie konserwatywnym przy wysyłaniu danych i liberalnym przy ich
przyjmowaniu, czyli wysyłać poprawnie, a przyjmować wszystko, co da
się zinterpretować; to założenie umożliwia rozszerzalność protokołów.


![LAN](img/lan.svg)

[Internet protocol suite](http://en.wikipedia.org/wiki/Internet_protocol_suite)

Note:

Podobnie jak w modelu OSI, w TCP/IP zakłada się
komunikację w ramach tych samych warstw oraz enkapsulację
oznaczającą „nieprzezroczystość” warstw niższych.


![UDP](img/udp.svg)

[Internet protocol suite](http://en.wikipedia.org/wiki/Internet_protocol_suite)

Note:

Przykład enkapsulacji danych w ramach datagramu UDP
przekazywanego w pakiecie IP stanowiącym dane ramki Ethernetowej.
