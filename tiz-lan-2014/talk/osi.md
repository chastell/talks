# model OSI


## warstwy OSI

<table>
  <tr>
    <th style='border: none'></th>
    <th>jednostka</th>
    <th>warstwa</th>
    <th>zadanie</th>
    <th>przykład</th>
  </tr>
  <tr>
    <th rowspan="4">warstwy hosta</th>
    <td rowspan="3">dane</td>
    <td>aplikacji</td>
    <td>komunikacja</td>
    <td>HTTP</td>
  </tr>
  <tr>
    <td>prezentacji</td>
    <td>format danych / szyfrowanie</td>
    <td>SSL</td>
  </tr>
  <tr>
    <td>sesji</td>
    <td>utrzymanie sesji</td>
    <td>gniazda</td>
  </tr>
  <tr>
    <td>segment</td>
    <td>transportowa</td>
    <td>utrzymanie spójności</td>
    <td>TCP, UDP</td>
  </tr>
  <tr>
    <th rowspan="3">warstwy mediów</th>
    <td>pakiet / datagram</td>
    <td>sieciowa</td>
    <td>droga i komutacja</td>
    <td>IP</td>
  </tr>
  <tr>
    <td>bit / ramka</td>
    <td>łącza danych</td>
    <td>spójność dwupunktowa</td>
    <td>Ethernet</td>
  </tr>
  <tr>
    <td>bit</td>
    <td>fizyczna</td>
    <td>transmisja bitów</td>
    <td></td>
  </tr>
</table>

Note: 12:45

Open Systems Interconnection


## fundamentalne założenia

komunikacja pomiędzy warstwami<br />tego samego poziomu

↓

enkapsulacja

Note: 12:48


[James Bond Meets the 7 Layer OSI Model](http://www.lewistech.com/rlewis/Resources/jamesX.aspx)

<dl>
  <dt>Application</dt>
  <dd>wiadomość od Numer Jeden</dd>
  <dt>Presentation</dt>
  <dd>tłumaczenie, kompresja i szyfrowanie</dd>
  <dt>Session</dt>
  <dd>sprawdzenie kompletności</dd>
  <dt>Transport</dt>
  <dd>podział na pakiety, połączenie z innymi</dd>
  <dt>Network</dt>
  <dd>znalezienie najszybszej drogi</dd>
  <dt>Data link</dt>
  <dd>wiadomość w specjalnej kopercie</dd>
  <dt>Physical</dt>
  <dd>ruszenie w drogę</dd>
</dl>

All People Seem To Need Data Processing

<aside class='notes'>
  <p>12:51</p>
</aside>
