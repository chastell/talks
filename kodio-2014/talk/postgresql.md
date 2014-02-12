# PostgreSQL

I believe that if Postgres had a catchy name (say,
SuperSQL) it would have left MySQL in the dust long
ago.<br />— Diego Basch <!-- .element: class="fragment quote" -->

Though incorrect, PostgreSQL is more fun to use<br />
when you pronounce it as ‘post-Grayskull’.<br />—
karlinfox <!-- .element: class="fragment quote" -->

<div class="fragment quote">Want to fall in love with
PostgreSQL by reading<br />just one page of the documentation?
Easy: [postgresql.org/docs/current/interactive/datatype.html
](http://www.postgresql.org/docs/current/interactive/datatype.html)<br
/>— James Edward Gray II</div>


<pre>
$ psql kod.io
psql (9.3.3)
Type "help" for help.
</pre>

<pre class='fragment'>
# CREATE TYPE track AS ENUM ('1', '2', 'both');
</pre>

<pre class='fragment'>
# CREATE TABLE agenda (
    track track DEFAULT 'both',
    speaker text, title text,
    time tstzrange NOT NULL,
    tags text[]
  );
</pre>

<pre class='fragment'>
# INSERT INTO agenda (title, time) VALUES
  ('Registration', '[2014-03-01 8:30, 2014-03-01 9:00)');
</pre>

<pre>
<span class='fragment'># SELECT track, title, time FROM agenda;</span>
<span class='fragment'>  track |    title     |                        time
 -------+--------------+-----------------------------------------------------
  both  | Registration | ["2014-03-01 08:30:00+01","2014-03-01 09:00:00+01")
(1 row)</span>
</pre>


<pre>
# INSERT INTO agenda (speaker, title, time)
  VALUES ('Klaus Luger & Katrin Eckstein',
  'Welcome Speech', '[2014-03-01 9:00, 2014-03-01 9:30)');
</pre>

<pre class='fragment'>
# INSERT INTO agenda (track, speaker, title, time, tags) VALUES
  ('1', 'Steve Scott', 'Going Native',
  '[2014-03-01 9:30, 2014-03-01 10:10)', '{"C#", "mobile"}');
</pre>

<pre class='fragment'>
# INSERT INTO agenda (track, speaker, title, time, tags) VALUES
  ('2', 'Lea Verou', 'The Chroma Zone',
  '[2014-03-01 9:30, 2014-03-01 10:00)', '{"CSS", "colour"}');
</pre>

<pre>
<span class='fragment'># SELECT track, speaker, title, tags FROM agenda;</span>
<span class='fragment'> track |            speaker            |      title      |     tags
-------+-------------------------------+-----------------+--------------
 both  |                               | Registration    |
 both  | Klaus Luger & Katrin Eckstein | Welcome Speech  |
 1     | Steve Scott                   | Going Native    | {C#,mobile}
 2     | Lea Verou                     | The Chroma Zone | {CSS,colour}
(4 rows)</span>
</pre>


<pre>
# INSERT INTO agenda (title, time) VALUES
  ('Break', '[2014-03-01 10:00, 2014-03-01 10:15)');
</pre>

<pre class='fragment'>
# INSERT INTO agenda (track, speaker, title, time, tags) VALUES
  ('1', 'Joanne Cheng', 'Beyond the Bar Graph',
  '[2014-03-01 10:15, 2014-03-01 10:50)', '{"JavaScript", "graphs"}');
</pre>

<pre class='fragment'>
# INSERT INTO agenda (track, speaker, title, time, tags) VALUES
  ('2', 'Pascal Precht', 'AngularJS and i18n',
  '[2014-03-01 10:15, 2014-03-01 10:50)', '{"AngularJS", "i18n"}');
</pre>

<pre class='fragment'>
# INSERT INTO agenda (track, speaker, title, time, tags) VALUES
  ('1', 'Burak Yiğit Kaya', 'Continuous Translation',
  '[2014-03-01 11:05, 2014-03-01 11:40)', '{"t9n"}');
</pre>

<pre class='fragment'>
# INSERT INTO agenda (track, speaker, title, time, tags) VALUES
  ('2', 'Anika Lindtner', 'How to Get More Women in Tech in 5 Steps',
  '[2014-03-01 11:05, 2014-03-01 11:40)', '{"women", "tech"}');
</pre>


<pre>
# SELECT track, title, to_char(lower(time), 'HH:MI') AS start, tags FROM agenda;
<span class='fragment'> track |                  title                   | start |        tags
-------+------------------------------------------+-------+---------------------
 both  | Registration                             | 08:30 |
 both  | Welcome Speech                           | 09:00 |
 1     | Going Native                             | 09:30 | {C#,mobile}
 2     | The Chroma Zone                          | 09:30 | {CSS,colour}
 both  | Break                                    | 10:00 |
 1     | Beyond the Bar Graph                     | 10:15 | {JavaScript,graphs}
 2     | AngularJS and i18n                       | 10:15 | {AngularJS,i18n}
 1     | Continuous Translation                   | 11:05 | {t9n}
 2     | How to Get More Women in Tech in 5 Steps | 11:05 | {women,tech}
(9 rows)</span>
</pre>


<pre>
# SELECT track, speaker, title, to_char(lower(time), 'HH:MI') AS start, tags
  FROM agenda WHERE time @> '2014-03-01 9:45'::timestamptz;
<span class='fragment'> track |   speaker   |      title      | start |     tags
-------+-------------+-----------------+-------+--------------
 1     | Steve Scott | Going Native    | 09:30 | {C#,mobile}
 2     | Lea Verou   | The Chroma Zone | 09:30 | {CSS,colour}
(2 rows)</span>
</pre>

<pre>
<span class='fragment'># SELECT track, speaker, title, to_char(lower(time), 'HH:MI') AS start, tags
  FROM agenda WHERE 'AngularJS' = ANY(tags) OR 'JavaScript' = ANY(tags);</span>
<span class='fragment'> track |    speaker    |        title         | start |        tags
-------+---------------+----------------------+-------+---------------------
 1     | Joanne Cheng  | Beyond the Bar Graph | 10:15 | {JavaScript,graphs}
 2     | Pascal Precht | AngularJS and i18n   | 10:15 | {AngularJS,i18n}
(2 rows)</span>
</pre>


# PostgreSQL

<ul>
<li class='fragment'>custom types</li>
<li><span class='fragment'>ranges</span> <span class='fragment'>and arrays</span> <span class='fragment'>and search</span> <span class='fragment'>and HStore</span><br /><span class='fragment'>and JSON</span> <span class='fragment'>and geometry types</span> <span class='fragment'>and PostGIS</span><br /><span class='fragment'>and XML</span> <span class='fragment'>and MAC+IPv4+IPv6</span> <span class='fragment'>and UUID and…</span></li>
<li class='fragment quote'>I truly believe that PostgreSQL<br />is the hacker’s RDBMS.<br />— Ryan Smith</li>
</ul>
