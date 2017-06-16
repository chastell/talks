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

Note: 12:54

dostępu do sieci (link): pojedynczy segment sieci

Internetu: łączy niezależne sieci

transportowa: komunikacja między procesami

aplikacji: interfejs użytkownika

początki w ARPANECIE w późnych latach 60., 1973:
przerzucenie odpowiedzialności za niezawodność na
hosty; 1974: pierwsza specyfikacja TCP; 1975: Stanford-Londyn;
1977: USA-UK-Norwegia; 1983: pełne przejście na TCP/IP

end-to-end: utrzymanie stanu na brzegach,
maksymalnie prosta i szybka komunikacja

robustness (krzepkość?): być konserwatywnym przy wysyłaniu i liberalnym
przy przyjmowaniu, czyli wysyłać poprawnie, a przyjmować wszystko, co
da się zinterpretować – rozszerzalność protokołów


![LAN](img/lan.svg)

[Internet protocol suite](http://en.wikipedia.org/wiki/Internet_protocol_suite)

Note: 12:57


![UDP](img/udp.svg)

[Internet protocol suite](http://en.wikipedia.org/wiki/Internet_protocol_suite)

<aside class='notes'>
  <p>13:00</p>
</aside>
