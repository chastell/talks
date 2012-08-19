!SLIDE

##  
##  
##  
##  

# Symbolic Functional Decomposition Method<br />for Implementation of Finite State Machines<br />in FPGA Devices

<h2 style='font-size: 2.1em;'>Piotr Szotkowski</h2>

##  

## promotor: prof. dr hab. inż. Tadeusz Łuba



!SLIDE

# symboliczna dekompozycja funkcjonalna

<div style='height: 3em;'></div>

![dekompozycja](symbolic.png)



!SLIDE

#  

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

#  

<table class='lay'>
  <tr>
    <td style='width: 59%;'>
      <table class='fsm state'>
        <thead>
          <tr><th></th><th>X</th><th>Q</th><th></th><th>Q’</th><th>Y</th></tr>
        </thead>
        <tbody>
          <tr><td> 1</td><td>–   –   0   0</td><td>init0 </td><td></td><td>init1 </td><td>0   0</td></tr>
          <tr><td> 2</td><td>0   1   0   0</td><td>init1 </td><td></td><td>init1 </td><td>0   0</td></tr>
          <tr><td> 3</td><td>–   –   1   –</td><td>init1 </td><td></td><td>init2 </td><td>1   0</td></tr>
          <tr><td> 4</td><td>1   –   1   0</td><td>init2 </td><td></td><td>init4 </td><td>1   0</td></tr>
          <tr><td> 5</td><td>–   1   1   1</td><td>init4 </td><td></td><td>init4 </td><td>1   0</td></tr>
          <tr><td> 6</td><td>–   –   0   1</td><td>init4 </td><td></td><td>IOwait</td><td>0   1</td></tr>
          <tr><td> 7</td><td>0   0   0   –</td><td>IOwait</td><td></td><td>IOwait</td><td>0   1</td></tr>
          <tr><td> 8</td><td>1   0   0   –</td><td>IOwait</td><td></td><td>init1 </td><td>0   1</td></tr>
          <tr><td> 9</td><td>0   1   1   0</td><td>IOwait</td><td></td><td>read0 </td><td>0   0</td></tr>
          <tr><td>10</td><td>1   1   0   0</td><td>IOwait</td><td></td><td>write0</td><td>1   1</td></tr>
          <tr><td>11</td><td>0   1   1   1</td><td>IOwait</td><td></td><td>RMACK </td><td>1   1</td></tr>
          <tr><td>12</td><td>1   1   0   1</td><td>IOwait</td><td></td><td>WMACK </td><td>0   0</td></tr>
          <tr><td>13</td><td>–   0   1   –</td><td>IOwait</td><td></td><td>init2 </td><td>0   1</td></tr>
          <tr><td>14</td><td>0   0   1   0</td><td>RMACK </td><td></td><td>RMACK </td><td>1   1</td></tr>
          <tr><td>15</td><td>0   1   1   1</td><td>RMACK </td><td></td><td>read0 </td><td>0   0</td></tr>
          <tr><td>16</td><td>1   1   0   0</td><td>WMACK </td><td></td><td>WMACK </td><td>0   0</td></tr>
          <tr><td>17</td><td>1   0   0   1</td><td>WMACK </td><td></td><td>write0</td><td>0   1</td></tr>
          <tr><td>18</td><td>0   0   0   1</td><td>read0 </td><td></td><td>read1 </td><td>1   1</td></tr>
          <tr><td>19</td><td>0   0   1   0</td><td>read1 </td><td></td><td>IOwait</td><td>0   1</td></tr>
          <tr><td>20</td><td>0   1   0   0</td><td>write0</td><td></td><td>IOwait</td><td>0   1</td></tr>
        </tbody>
      </table>
    </td>
    <td>
      <ul>
        <li>β<sub>Q</sub> = {{1}, {2,3}, {4}, {5,6},<br />{7,8,9,10,11,12,13}, {14,15},<br />{16,17}, {18}, {19}, {20}}</li>
        <li>β<sub>Q<sub>U</sub></sub> = {{1,2,3}, {4,5,6,18,19,20},<br />{7,8,9,10,11,12,13}, {14,15,16,17}}</li>
        <li>β<sub>Q<sub>V</sub></sub> = {{1,7,8,9,10,11,12,13,19},<br />{2,3,14,15,18}, {4,5,6,16,17,20}}</li>
      </ul>
    </td>
  </tr>
</table>



!SLIDE

#  

<table class='lay'>
  <tr>
    <td style='width: 59%;'>
      <table class='fsm state encoded2'>
        <thead>
          <tr><th></th><th>X</th><th>Q<sub>U</sub></th><th>Q<sub>V</sub></th><th></th><th>Q’<sub>U</sub></th><th>Q’<sub>V</sub></th><th>Y</th></tr>
        </thead>
        <tbody>
          <tr><td> 1</td><td>–   –   0   0</td><td>u<sub>1</sub></td><td>v<sub>1</sub></td><td></td><td>u<sub>1</sub></td><td>v<sub>2</sub></td><td>0   0</td></tr>
          <tr><td> 2</td><td>0   1   0   0</td><td>u<sub>1</sub></td><td>v<sub>2</sub></td><td></td><td>u<sub>1</sub></td><td>v<sub>2</sub></td><td>0   0</td></tr>
          <tr><td> 3</td><td>–   –   1   –</td><td>u<sub>1</sub></td><td>v<sub>2</sub></td><td></td><td>u<sub>2</sub></td><td>v<sub>3</sub></td><td>1   0</td></tr>
          <tr><td> 4</td><td>1   –   1   0</td><td>u<sub>2</sub></td><td>v<sub>3</sub></td><td></td><td>u<sub>2</sub></td><td>v<sub>3</sub></td><td>1   0</td></tr>
          <tr><td> 5</td><td>–   1   1   1</td><td>u<sub>2</sub></td><td>v<sub>3</sub></td><td></td><td>u<sub>2</sub></td><td>v<sub>3</sub></td><td>1   0</td></tr>
          <tr><td> 6</td><td>–   –   0   1</td><td>u<sub>2</sub></td><td>v<sub>3</sub></td><td></td><td>u<sub>3</sub></td><td>v<sub>1</sub></td><td>0   1</td></tr>
          <tr><td> 7</td><td>0   0   0   –</td><td>u<sub>3</sub></td><td>v<sub>1</sub></td><td></td><td>u<sub>3</sub></td><td>v<sub>1</sub></td><td>0   1</td></tr>
          <tr><td> 8</td><td>1   0   0   –</td><td>u<sub>3</sub></td><td>v<sub>1</sub></td><td></td><td>u<sub>1</sub></td><td>v<sub>2</sub></td><td>0   1</td></tr>
          <tr><td> 9</td><td>0   1   1   0</td><td>u<sub>3</sub></td><td>v<sub>1</sub></td><td></td><td>u<sub>2</sub></td><td>v<sub>2</sub></td><td>0   0</td></tr>
          <tr><td>10</td><td>1   1   0   0</td><td>u<sub>3</sub></td><td>v<sub>1</sub></td><td></td><td>u<sub>2</sub></td><td>v<sub>3</sub></td><td>1   1</td></tr>
          <tr><td>11</td><td>0   1   1   1</td><td>u<sub>3</sub></td><td>v<sub>1</sub></td><td></td><td>u<sub>4</sub></td><td>v<sub>2</sub></td><td>1   1</td></tr>
          <tr><td>12</td><td>1   1   0   1</td><td>u<sub>3</sub></td><td>v<sub>1</sub></td><td></td><td>u<sub>4</sub></td><td>v<sub>3</sub></td><td>0   0</td></tr>
          <tr><td>13</td><td>–   0   1   –</td><td>u<sub>3</sub></td><td>v<sub>1</sub></td><td></td><td>u<sub>2</sub></td><td>v<sub>3</sub></td><td>0   1</td></tr>
          <tr><td>14</td><td>0   0   1   0</td><td>u<sub>4</sub></td><td>v<sub>2</sub></td><td></td><td>u<sub>4</sub></td><td>v<sub>2</sub></td><td>1   1</td></tr>
          <tr><td>15</td><td>0   1   1   1</td><td>u<sub>4</sub></td><td>v<sub>2</sub></td><td></td><td>u<sub>2</sub></td><td>v<sub>2</sub></td><td>0   0</td></tr>
          <tr><td>16</td><td>1   1   0   0</td><td>u<sub>4</sub></td><td>v<sub>3</sub></td><td></td><td>u<sub>4</sub></td><td>v<sub>3</sub></td><td>0   0</td></tr>
          <tr><td>17</td><td>1   0   0   1</td><td>u<sub>4</sub></td><td>v<sub>3</sub></td><td></td><td>u<sub>2</sub></td><td>v<sub>3</sub></td><td>0   1</td></tr>
          <tr><td>18</td><td>0   0   0   1</td><td>u<sub>2</sub></td><td>v<sub>2</sub></td><td></td><td>u<sub>2</sub></td><td>v<sub>1</sub></td><td>1   1</td></tr>
          <tr><td>19</td><td>0   0   1   0</td><td>u<sub>2</sub></td><td>v<sub>1</sub></td><td></td><td>u<sub>3</sub></td><td>v<sub>1</sub></td><td>0   1</td></tr>
          <tr><td>20</td><td>0   1   0   0</td><td>u<sub>2</sub></td><td>v<sub>3</sub></td><td></td><td>u<sub>3</sub></td><td>v<sub>1</sub></td><td>0   1</td></tr>
        </tbody>
      </table>
    </td>
    <td>
      <ul>
        <li>β<sub>Q</sub> = {{1}, {2,3}, {4}, {5,6},<br />{7,8,9,10,11,12,13}, {14,15},<br />{16,17}, {18}, {19}, {20}}</li>
        <li>β<sub>Q<sub>U</sub></sub> = {{1,2,3}, {4,5,6,18,19,20},<br />{7,8,9,10,11,12,13}, {14,15,16,17}}</li>
        <li>β<sub>Q<sub>V</sub></sub> = {{1,7,8,9,10,11,12,13,19},<br />{2,3,14,15,18}, {4,5,6,16,17,20}}</li>
      </ul>
    </td>
  </tr>
</table>



!SLIDE

#  

<table class='lay' style='font-size: 1.2em; margin-top: -0.5em;'>
  <tr>
    <td style='vertical-align: top; width: 55%;'>
      <table class='fsm'>
        <thead>
          <tr><th>β<sub>Q</sub></th><th>Q</th><th></th><th>Q<sub>U</sub></th><th>Q<sub>V</sub></th></tr>
        </thead>
        <tbody>
          <tr><td>                1</td><td>init0 </td><td></td><td>u<sub>1</sub></td><td>v<sub>1</sub></td></tr>
          <tr><td>              2,3</td><td>init1 </td><td></td><td>u<sub>1</sub></td><td>v<sub>2</sub></td></tr>
          <tr><td>                4</td><td>init2 </td><td></td><td>u<sub>2</sub></td><td>v<sub>3</sub></td></tr>
          <tr><td>              5,6</td><td>init4 </td><td></td><td>u<sub>2</sub></td><td>v<sub>3</sub></td></tr>
          <tr><td>7,8,9,10,11,12,13</td><td>IOwait</td><td></td><td>u<sub>3</sub></td><td>v<sub>1</sub></td></tr>
          <tr><td>            14,15</td><td>RMACK </td><td></td><td>u<sub>4</sub></td><td>v<sub>2</sub></td></tr>
          <tr><td>            16,17</td><td>WMACK </td><td></td><td>u<sub>4</sub></td><td>v<sub>3</sub></td></tr>
          <tr><td>               18</td><td>read0 </td><td></td><td>u<sub>2</sub></td><td>v<sub>2</sub></td></tr>
          <tr><td>               19</td><td>read1 </td><td></td><td>u<sub>2</sub></td><td>v<sub>1</sub></td></tr>
          <tr><td>               20</td><td>write0</td><td></td><td>u<sub>2</sub></td><td>v<sub>3</sub></td></tr>
        </tbody>
      </table>
      <p style='font-size: 1.5em; margin-top: 0.5em;'>β<sub>G</sub> = {{1,7,8,10}; {2,4,5,11,13,18}; {3,6,9,13,14,15,16,17,19,20}; {7,8,12}}</p>
    </td>
    <td style='vertical-align: top;'>
      <table class='fsm'>
        <thead>
          <tr><th>β<sub>V</sub> • β<sub>Q<sub>V</sub></sub></th><th>x<sub>3</sub></th><th>x<sub>4</sub></th><th>Q<sub>V</sub></th><th></th><th>G</th></tr>
        </thead>
        <tbody>
          <tr><td>1,7,8,10</td><td>0</td><td>0</td><td>v<sub>1</sub></td><td></td><td>g<sub>1</sub></td></tr>
          <tr><td>       2</td><td>0</td><td>0</td><td>v<sub>2</sub></td><td></td><td>g<sub>2</sub></td></tr>
          <tr><td>    3,14</td><td>1</td><td>0</td><td>v<sub>2</sub></td><td></td><td>g<sub>3</sub></td></tr>
          <tr><td>    3,15</td><td>1</td><td>1</td><td>v<sub>2</sub></td><td></td><td>g<sub>3</sub></td></tr>
          <tr><td>       4</td><td>1</td><td>0</td><td>v<sub>3</sub></td><td></td><td>g<sub>2</sub></td></tr>
          <tr><td>       5</td><td>1</td><td>1</td><td>v<sub>3</sub></td><td></td><td>g<sub>2</sub></td></tr>
          <tr><td>    6,17</td><td>0</td><td>1</td><td>v<sub>3</sub></td><td></td><td>g<sub>3</sub></td></tr>
          <tr><td>  7,8,12</td><td>0</td><td>1</td><td>v<sub>1</sub></td><td></td><td>g<sub>4</sub></td></tr>
          <tr><td> 9,13,19</td><td>1</td><td>0</td><td>v<sub>1</sub></td><td></td><td>g<sub>3</sub></td></tr>
          <tr><td>   11,13</td><td>1</td><td>1</td><td>v<sub>1</sub></td><td></td><td>g<sub>2</sub></td></tr>
          <tr><td>   16,20</td><td>0</td><td>0</td><td>v<sub>3</sub></td><td></td><td>g<sub>3</sub></td></tr>
          <tr><td>      18</td><td>0</td><td>1</td><td>v<sub>2</sub></td><td></td><td>g<sub>2</sub></td></tr>
        </tbody>
      </table>
    </td>
  </tr>
</table>



!SLIDE

# wybrane publikacje

<div style='margin: 0 6em; font-size: 0.71em;'>
  <h2 style='text-align: left;'><i>Application of Symbolic Functional Decomposition Concept in FSM Implementation Targeting FPGA Devices</i>. Sixth International Conference on Computational Intelligence and Multimedia Applications ICCIMA 2005</h2>
  <h2 style='text-align: left;'><i>Multilevel Synthesis of Finite State Machines Based on Symbolic Functional Decomposition.</i> International Journal of Computational Intelligence and Applications</h2>
  <h2 style='text-align: left;'><i>Algorytm funkcjonalnej dekompozycji symbolicznej automatów skończonych dla celów implementacji w strukturach FPGA.</i> Pomiary, Automatyka, Kontrola</h2>
  <h2 style='text-align: left;'><i>Symbolic Functional Decomposition Algorithm for FSM Implementation.</i> The International Conference on “Computer as a Tool” EUROCON 2007</h2>
  <h2 style='text-align: left;'><i>A Graph-Based Symbolic Functional Decomposition Algorithm for FSM Implementation.</i> 2008 Conference on Human System Interactions</h2>
  <h2 style='text-align: left;'><i>Improvements to Symbolic Functional Decomposition Algorithms for FSM Implementation in FPGA Devices.</i> Electronics and Telecommunications Quarterly</h2>
  <h2 style='text-align: left;'><i>A Graph-Based Approach to Symbolic Functional Decomposition of Finite State Machines.</i> Systems Science</h2>
  <h2 style='text-align: left;'><i>A Comparison of Symbolic Functional Decomposition Algorithms for Finite State Machine Implementation in FPGA Devices.</i> III Konferencja naukowo-techniczna doktorantów i młodych naukowców 2008</h2>
  <h2 style='text-align: left;'><i>Input Selection Methods for Symbolic Functional Decomposition of Finite State Machines.</i> Proc. of 4th International PhD Students and Young Scientists Conference 2009</h2>
</div>



!SLIDE

# złożoność

## **dobór U i V**
## wyczerpujący: O(2<sup>|X|</sup>)
## ogólnej istotności wejść<br />i unikalności dostarczanej informacji: O(2<sup>|seq|</sup>)

## **konstrukcja β<sub>Q<sub>U</sub></sub>**
## <i>r</i>-przydatność: O(|β<sub>Q</sub>|<sup>2</sup> · |β<sub>U</sub>|)
## łączenie wierzchołków grafu: O(|β<sub>Q</sub>|)<sup>2</sup> · log<sub>2</sub>|β<sub>Q</sub>|)

## **konstrukcja β<sub>G</sub> i β<sub>Q<sub>V</sub></sub>**
## kolorowanie grafu niezgodności: O(|β|<sup>2</sup> · |S|)
## łączenie wierzchołków grafu: O(|β|<sup>2</sup> · |S|)
## kolorowanie równoległe: O(|β<sub>Q</sub> • β<sub>V</sub>|<sup>2</sup> · |S| + |β<sub>Q</sub> • S<sub>V</sub>|<sup>4</sup>)
