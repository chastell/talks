# model LAN


## model LAN

<table>
  <tr>
    <th colspan='2'>OSI</th>
    <th colspan='5'>LAN</th>
  </tr>
  <tr>
    <td rowspan='2'>(~sieci) łącza&nbsp;danych</td>
    <td>LLC</td>
    <td rowspan='3'>Ethernet&nbsp;II</td>
    <td colspan='4'>IEEE 802.2</td>
  </tr>
  <tr>
    <td>MAC</td>
    <td rowspan='2'>IEEE&nbsp;802.3</td>
    <td rowspan='2'><nobr>100BASE-T</nobr></td>
    <td rowspan='2'>IEEE&nbsp;802.5</td>
    <td rowspan='2'>FDDI</td>
  </tr>
  <tr>
    <td>fizyczna</td>
    <td>PHY</td>
</table>

<aside class='notes'>
  <p>13:15</p>
  <p>802.5: Token Ring</p>

  <p>802.2: Logical Link Control; dodaje informacje
  do ramek warstwy wyższej i przekazuje niżej</p>

  <p>nagłówek LLC: trzy pola, DSAP, SSAP, Control</p>

  <p>Destination Service Access Point: 8 bitów,
  docelowy adres logiczny jednostki warstwy sieci</p>

  <p>Source Service Access Point: 8 bitów, źródłowy</p>

  <p>Control: 8 lub 16 bitów, format pakietu
  i ew. informacje typu flow control</p>

  <p>Service Access Point: przyznawane
  globalnie numery; IP nie ma takiego numeru</p>

  <p>Subnetwork Access Point (SNAP): pozwala EtherType jako SAP</p>

  <p>MAC: Media Access Control – Ethernet, Token Ring, FDDI, 802.11</p>
  <p>w warstwie łącza: ARP (IP → MAC)</p>
  <p>podwarstwa Logical Link Control: pozwala na
  wiele protokołów (IP, Appletalk) w jednej sieci</p>

  <p>podwarstwa Media Access Control</p>
</aside>
