!SLIDE

# symboliczna dekompozycja funkcjonalna

<table class='lay'>
  <tr>
    <td>
      <ul>
        <li>nowa metoda implementacji automatów</li>
        <li>brak etapu wstępnego kodowania stanów</li>
        <li>częściowe kodowanie stanów w trakcie dekompozycji</li>
      </ul>
    </td>
    <td>
      <p><img src='image/symbolic/symbolic.png' /></p>
    </td>
  </tr>
</table>



!SLIDE

# częściowe kodowanie stanów

<table class='lay'>
  <tr>
    <td>
      <table class='fsm state'>
        <thead>
          <tr><th>X</th><th>Q</th><th></th><th>Q’</th><th>Y</th></tr>
        </thead>
        <tbody>
          <tr><td>–   –   0   0</td><td>init0 </td><td></td><td>init1 </td><td>0   0</td></tr>
          <tr><td>0   1   0   0</td><td>init1 </td><td></td><td>init1 </td><td>0   0</td></tr>
          <tr><td>–   –   1   –</td><td>init1 </td><td></td><td>init2 </td><td>1   0</td></tr>
          <tr><td>1   –   1   0</td><td>init2 </td><td></td><td>init4 </td><td>1   0</td></tr>
          <tr><td>–   1   1   1</td><td>init4 </td><td></td><td>init4 </td><td>1   0</td></tr>
          <tr><td>–   –   0   1</td><td>init4 </td><td></td><td>IOwait</td><td>0   1</td></tr>
          <tr><td>0   0   0   –</td><td>IOwait</td><td></td><td>IOwait</td><td>0   1</td></tr>
          <tr><td>1   0   0   –</td><td>IOwait</td><td></td><td>init1 </td><td>0   1</td></tr>
          <tr><td>0   1   1   0</td><td>IOwait</td><td></td><td>read0 </td><td>0   0</td></tr>
          <tr><td>1   1   0   0</td><td>IOwait</td><td></td><td>write0</td><td>1   1</td></tr>
          <tr><td>0   1   1   1</td><td>IOwait</td><td></td><td>RMACK </td><td>1   1</td></tr>
          <tr><td>1   1   0   1</td><td>IOwait</td><td></td><td>WMACK </td><td>0   0</td></tr>
          <tr><td>–   0   1   –</td><td>IOwait</td><td></td><td>init2 </td><td>0   1</td></tr>
          <tr><td>0   0   1   0</td><td>RMACK </td><td></td><td>RMACK </td><td>1   1</td></tr>
          <tr><td>0   1   1   1</td><td>RMACK </td><td></td><td>read0 </td><td>0   0</td></tr>
          <tr><td>1   1   0   0</td><td>WMACK </td><td></td><td>WMACK </td><td>0   0</td></tr>
          <tr><td>1   0   0   1</td><td>WMACK </td><td></td><td>write0</td><td>0   1</td></tr>
          <tr><td>0   0   0   1</td><td>read0 </td><td></td><td>read1 </td><td>1   1</td></tr>
          <tr><td>0   0   1   0</td><td>read1 </td><td></td><td>IOwait</td><td>0   1</td></tr>
          <tr><td>0   1   0   0</td><td>write0</td><td></td><td>IOwait</td><td>0   1</td></tr>
        </tbody>
      </table>
    </td>
    <td>
      <table class='fsm state encoded'>
        <thead>
          <tr><th>X</th><th>Q<sub>U</sub></th><th>Q<sub>V</sub></th><th></th><th>Q’<sub>U</sub></th><th>Q’<sub>V</sub></th><th>Y</th></tr>
        </thead>
        <tbody>
          <tr><td>–   –   0   0</td><td>u<sub>1</sub></td><td>v<sub>1</sub></td><td></td><td>u<sub>1</sub></td><td>v<sub>2</sub></td><td>0   0</td></tr>
          <tr><td>0   1   0   0</td><td>u<sub>1</sub></td><td>v<sub>2</sub></td><td></td><td>u<sub>1</sub></td><td>v<sub>2</sub></td><td>0   0</td></tr>
          <tr><td>–   –   1   –</td><td>u<sub>1</sub></td><td>v<sub>2</sub></td><td></td><td>u<sub>2</sub></td><td>v<sub>3</sub></td><td>1   0</td></tr>
          <tr><td>1   –   1   0</td><td>u<sub>2</sub></td><td>v<sub>3</sub></td><td></td><td>u<sub>2</sub></td><td>v<sub>3</sub></td><td>1   0</td></tr>
          <tr><td>–   1   1   1</td><td>u<sub>2</sub></td><td>v<sub>3</sub></td><td></td><td>u<sub>2</sub></td><td>v<sub>3</sub></td><td>1   0</td></tr>
          <tr><td>–   –   0   1</td><td>u<sub>2</sub></td><td>v<sub>3</sub></td><td></td><td>u<sub>3</sub></td><td>v<sub>1</sub></td><td>0   1</td></tr>
          <tr><td>0   0   0   –</td><td>u<sub>3</sub></td><td>v<sub>1</sub></td><td></td><td>u<sub>3</sub></td><td>v<sub>1</sub></td><td>0   1</td></tr>
          <tr><td>1   0   0   –</td><td>u<sub>3</sub></td><td>v<sub>1</sub></td><td></td><td>u<sub>1</sub></td><td>v<sub>2</sub></td><td>0   1</td></tr>
          <tr><td>0   1   1   0</td><td>u<sub>3</sub></td><td>v<sub>1</sub></td><td></td><td>u<sub>2</sub></td><td>v<sub>2</sub></td><td>0   0</td></tr>
          <tr><td>1   1   0   0</td><td>u<sub>3</sub></td><td>v<sub>1</sub></td><td></td><td>u<sub>2</sub></td><td>v<sub>3</sub></td><td>1   1</td></tr>
          <tr><td>0   1   1   1</td><td>u<sub>3</sub></td><td>v<sub>1</sub></td><td></td><td>u<sub>4</sub></td><td>v<sub>2</sub></td><td>1   1</td></tr>
          <tr><td>1   1   0   1</td><td>u<sub>3</sub></td><td>v<sub>1</sub></td><td></td><td>u<sub>4</sub></td><td>v<sub>3</sub></td><td>0   0</td></tr>
          <tr><td>–   0   1   –</td><td>u<sub>3</sub></td><td>v<sub>1</sub></td><td></td><td>u<sub>2</sub></td><td>v<sub>3</sub></td><td>0   1</td></tr>
          <tr><td>0   0   1   0</td><td>u<sub>4</sub></td><td>v<sub>2</sub></td><td></td><td>u<sub>4</sub></td><td>v<sub>2</sub></td><td>1   1</td></tr>
          <tr><td>0   1   1   1</td><td>u<sub>4</sub></td><td>v<sub>2</sub></td><td></td><td>u<sub>2</sub></td><td>v<sub>2</sub></td><td>0   0</td></tr>
          <tr><td>1   1   0   0</td><td>u<sub>4</sub></td><td>v<sub>3</sub></td><td></td><td>u<sub>4</sub></td><td>v<sub>3</sub></td><td>0   0</td></tr>
          <tr><td>1   0   0   1</td><td>u<sub>4</sub></td><td>v<sub>3</sub></td><td></td><td>u<sub>2</sub></td><td>v<sub>3</sub></td><td>0   1</td></tr>
          <tr><td>0   0   0   1</td><td>u<sub>2</sub></td><td>v<sub>2</sub></td><td></td><td>u<sub>2</sub></td><td>v<sub>1</sub></td><td>1   1</td></tr>
          <tr><td>0   0   1   0</td><td>u<sub>2</sub></td><td>v<sub>1</sub></td><td></td><td>u<sub>3</sub></td><td>v<sub>1</sub></td><td>0   1</td></tr>
          <tr><td>0   1   0   0</td><td>u<sub>2</sub></td><td>v<sub>3</sub></td><td></td><td>u<sub>3</sub></td><td>v<sub>1</sub></td><td>0   1</td></tr>
        </tbody>
      </table>
    </td>
  </tr>
</table>



!SLIDE

# symboliczna dekompozycja funkcjonalna

<table class='lay'>
  <tr>
    <td>
      <ul>
        <li>rozszerzenie rachunku nakryć</li>
        <li>automat skończony<br />ma funkcjonalną dekompozycję symboliczną względem U, Q<sub>U</sub>, Q<sub>V</sub> i V jeśli istnieje nakrycie β<sub>G</sub> takie, że β<sub>V</sub> • β<sub>Q<sub>V</sub></sub> ≤ β<sub>G</sub> oraz β<sub>U</sub> • β<sub>Q<sub>U</sub></sub> • β<sub>G</sub> ≤ β<sub><sub>Y</sub></sub> • β<sub>Q’</sub></li>
      </ul>
    </td>
    <td>
      <p><img src='image/symbolic/symbolic.png' /></p>
    </td>
  </tr>
</table>



!SLIDE

# symboliczna dekompozycja funkcjonalna

<table class='lay'>
  <tr>
    <td>
      <ul>
        <li>wyznaczanie dekompozycji:</li>
        <li style='color: green;'>dobór U i V</li>
        <li style='color: teal;'>konstrukcja β<sub>Q<sub>U</sub></sub></li>
        <li style='color: blue;'>konstrukcja β<sub>G</sub> i β<sub>Q<sub>V</sub></sub></li>
      </ul>
    </td>
    <td>
      <p><img src='image/symbolic/symbolic.col.png' /></p>
    </td>
  </tr>
</table>
