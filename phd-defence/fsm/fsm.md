!SLIDE

# automat skończony

<table class='lay' style='margin-top: 6em;'>
  <tr>
    <td style='vertical-align: top;'>
      <table class='fsm'>
        <thead>
          <tr><th>wejście</th><th>stan akt.</th><th></th><th>stan nast.</th><th>wyjście</th></tr>
        </thead>
        <tbody>
          <tr><td>zasuń</td><td>odsunięte</td><td></td><td>zasunięte</td><td>zasuwanie</td></tr>
          <tr><td>zamknij</td><td>zasunięte</td><td></td><td>zamknięte</td><td>zamykanie</td></tr>
          <tr><td>otwórz</td><td>zamknięte</td><td></td><td>zasunięte</td><td>otwieranie</td></tr>
          <tr><td>odsuń</td><td>zasunięte</td><td></td><td>odsunięte</td><td>odsuwanie</td></tr>
        </tbody>
        <tbody>
          <tr style='height: 3em;'></tr>
        </tbody>
        <thead>
          <tr><th>X</th><th>Q</th><th></th><th>Q’</th><th>Y</th></tr>
        </thead>
        <tbody>
          <tr><td>0     0</td><td>odsunięte</td><td></td><td>zasunięte</td><td>0     0</td></tr>
          <tr><td>0     1</td><td>zasunięte</td><td></td><td>zamknięte</td><td>0     1</td></tr>
          <tr><td>1     0</td><td>zamknięte</td><td></td><td>zasunięte</td><td>1     0</td></tr>
          <tr><td>1     1</td><td>zasunięte</td><td></td><td>odsunięte</td><td>1     1</td></tr>
        </tbody>
      </table>
    </td>
    <td style='vertical-align: top;'>
      <p><img src='image/fsm/fsm.graph.png' /></p>
      <p style='height: 3em;'></p>
      <p><img src='image/fsm/fsm.schema.png' /></p>
    </td>
  </tr>
</table>



!SLIDE

# automat skończony

<table class='lay' style='margin-top: 6em;'>
  <tr>
    <td style='vertical-align: top;'>
      <table class='fsm'>
        <thead>
          <tr><th>wejście</th><th>stan akt.</th><th></th><th>stan nast.</th><th>wyjście</th></tr>
        </thead>
        <tbody>
          <tr><td>zasuń</td><td>odsunięte</td><td></td><td>zasunięte</td><td>zasuwanie</td></tr>
          <tr><td>zamknij</td><td>zasunięte</td><td></td><td>zamknięte</td><td>zamykanie</td></tr>
          <tr><td>otwórz</td><td>zamknięte</td><td></td><td>zasunięte</td><td>otwieranie</td></tr>
          <tr><td>odsuń</td><td>zasunięte</td><td></td><td>odsunięte</td><td>odsuwanie</td></tr>
        </tbody>
        <tbody>
          <tr style='height: 3em;'></tr>
        </tbody>
        <thead>
          <tr><th>X</th><th>Q</th><th></th><th>Q’</th><th>Y</th></tr>
        </thead>
        <tbody>
          <tr><td>0     0</td><td>odsunięte</td><td></td><td>zasunięte</td><td>0     0</td></tr>
          <tr><td>0     1</td><td>zasunięte</td><td></td><td>zamknięte</td><td>0     1</td></tr>
          <tr><td>1     0</td><td>zamknięte</td><td></td><td>zasunięte</td><td>1     0</td></tr>
          <tr><td>1     1</td><td>zasunięte</td><td></td><td>odsunięte</td><td>1     1</td></tr>
        </tbody>
      </table>
    </td>
    <td style='vertical-align: top;'>
      <p><img src='image/fsm/fsm.graph.png' /></p>
      <p style='height: 3em;'></p>
      <p><img src='image/fsm/fsm.logic.png' /></p>
    </td>
  </tr>
</table>



!SLIDE

# automat skończony

<table class='lay' style='margin-top: 6em;'>
  <tr>
    <td style='vertical-align: top;'>
      <table class='fsm'>
        <thead>
          <tr><th>wejście</th><th>stan akt.</th><th></th><th>stan nast.</th><th>wyjście</th></tr>
        </thead>
        <tbody>
          <tr><td>zasuń</td><td>odsunięte</td><td></td><td>zasunięte</td><td>zasuwanie</td></tr>
          <tr><td>zamknij</td><td>zasunięte</td><td></td><td>zamknięte</td><td>zamykanie</td></tr>
          <tr><td>otwórz</td><td>zamknięte</td><td></td><td>zasunięte</td><td>otwieranie</td></tr>
          <tr><td>odsuń</td><td>zasunięte</td><td></td><td>odsunięte</td><td>odsuwanie</td></tr>
        </tbody>
        <tbody>
          <tr style='height: 3em;'></tr>
        </tbody>
        <thead>
          <tr><th>X</th><th>Q</th><th></th><th>Q’</th><th>Y</th></tr>
        </thead>
        <tbody>
          <tr><td>0     0</td><td>odsunięte</td><td></td><td>zasunięte</td><td>0     0</td></tr>
          <tr><td>0     1</td><td>zasunięte</td><td></td><td>zamknięte</td><td>0     1</td></tr>
          <tr><td>1     0</td><td>zamknięte</td><td></td><td>zasunięte</td><td>1     0</td></tr>
          <tr><td>1     1</td><td>zasunięte</td><td></td><td>odsunięte</td><td>1     1</td></tr>
        </tbody>
      </table>
    </td>
    <td style='vertical-align: top;'>
      <p><img src='image/fsm/fsm.graph.png' /></p>
      <p style='height: 3em;'></p>
      <p><img src='image/fsm/fsm.circled.png' /></p>
    </td>
  </tr>
</table>



!SLIDE

# kodowanie stanów automatu

<table class='lay' style='width: 75%;'>
  <tr>
    <td>
      <table class='fsm' style='font-size: 1.4em;'>
        <thead>
          <tr><th>X</th><th>Q</th><th></th><th>Q’</th><th>Y</th></tr>
        </thead>
        <tbody>
          <tr><td>0     0</td><td>0     0</td><td></td><td>0     1</td><td>0     0</td></tr>
          <tr><td>0     1</td><td>0     1</td><td></td><td>1     0</td><td>0     1</td></tr>
          <tr><td>1     0</td><td>1     0</td><td></td><td>0     1</td><td>1     0</td></tr>
          <tr><td>1     1</td><td>0     1</td><td></td><td>0     0</td><td>1     1</td></tr>
        </tbody>
      </table>
    </td>
    <td>
      <p><img src='image/fsm/fsm.encoded.png' /></p>
    </td>
  </tr>
</table>

## liczba różnych kodowań o minimalnej liczbie bitów<br />rośnie wraz z silnią liczby stanów

## kodowanie o minimalnej liczbie bitów nie zawsze gwarantuje najlepsze wyniki



!SLIDE

# kodowanie + odwzorowanie

<table class='lay'>
  <tr>
    <td>
      <ul>
        <li>problem doboru kodowania stanów</li>
        <li>problem wyboru U i V</li>
        <li>problem stworzenia G</li>
        <li>dekompozycja H zależy od powyższych</li>
      </ul>
    </td>
    <td>
      <p><img src='image/fpga/binary.png' /></p>
    </td>
  </tr>
</table>

## metody kodowania stanów:<br />sekwencyjna, kod Graya, JEDI, NOVA, one-hot, Secode

## powszechnie stosuje się kodowanie + odwzorowanie<br />z nadzieją, że funkcja będzie efektywnie realizowalna
