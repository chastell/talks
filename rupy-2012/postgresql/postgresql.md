!SLIDE bullets incremental transition=scrollLeft
# PostgreSQL
* <div class='quote'>I believe that if Postgres had a catchy name (say, SuperSQL)<br />it would have left MySQL in the dust long ago.<br />— Diego Basch</div>
* <div class='quote'>Though incorrect, PostgreSQL is more fun to<br />use when you pronounce it as ‘post-Grayskull’.<br />— karlinfox</div>
* <div class='quote'>Want to fall in love with PostgreSQL by reading<br />just one page of the documentation? Easy: [http://www.postgresql.org/docs/current/interactive/datatype.html](http://www.postgresql.org/docs/current/interactive/datatype.html)<br />— James Edward Gray II</div>

!SLIDE commandline incremental
    $ psql rupy
    psql (9.2.1)
    Type "help" for help.

    # CREATE TYPE track AS ENUM ('1', '2', 'both');
    CREATE TYPE

    # CREATE TABLE agenda (                      \
        track track DEFAULT 'both',              \
        speaker text, title text, abstract text, \
        time tstzrange NOT NULL,                 \
        tags text[]                              \
      );
    CREATE TABLE

    # INSERT INTO agenda (title, time) VALUES                 \
      ('Registration', '[2012-11-17 8:45, 2012-11-17 9:30)');
    INSERT 0 1

    # SELECT track, title, time FROM agenda;
     track |    title     |                        time
    -------+--------------+-----------------------------------------------------
     both  | Registration | ["2012-11-17 08:45:00+01","2012-11-17 09:30:00+01")
    (1 row)

!SLIDE commandline incremental
    # INSERT INTO agenda (speaker, title, time) VALUES                   \
      ('Zed A. Shaw', 'Keynote', '[2012-11-17 9:30, 2012-11-17 10:15)');
    INSERT 0 1

    # INSERT INTO agenda (track, speaker, title, abstract, time, tags) VALUES \
      ('1', 'José Valim', 'Elixir', 'In this talk, José Valim will cover…',   \
      '[2012-11-17 10:15, 2012-11-17 10:45)', '{"Elixir", "Erlang"}');
    INSERT 0 1

    # INSERT INTO agenda (track, speaker, title, abstract, time, tags) VALUES \
      ('2', 'Honza Král', 'Extendable Django Apps', 'I will describe how…',   \
      '[2012-11-17 10:15, 2012-11-17 10:45)', '{"Django", "Python"}');
    INSERT 0 1

    # SELECT track, speaker, title, tags FROM agenda;
     track |     speaker     |           title           |          tags
    -------+-----------------+---------------------------+------------------------
     both  |                 | Registration              |
     both  | Zed A. Shaw     | Keynote                   |
     1     | José Valim      | Elixir                    | {Elixir,Erlang}
     2     | Honza Král      | Extendable Django Apps    | {Django,Python}
    (4 rows)

!SLIDE commandline
    # INSERT INTO agenda (title, time) VALUES            \
      ('Break', '[2012-11-17 10:45, 2012-11-17 11:00)');
    INSERT 0 1

    # INSERT INTO agenda (track, speaker, title, abstract, time, tags) VALUES \
      ('1', 'Igor Minár', 'AngularJS', 'What if you could write modern web…', \
      '[2012-11-17 11:00, 2012-11-17 11:30)', '{"AngularJS", "JavaScript"}');
    INSERT 0 1

    # INSERT INTO agenda (track, speaker, title, abstract, time, tags) VALUES \
      ('2', 'Olov Lassus', 'JS – from good to great', 'Is it possible to…',   \
      '[2012-11-17 11:00, 2012-11-17 11:30)', '{"JavaScript"}');
    INSERT 0 1

    # INSERT INTO agenda (track, speaker, title, time) VALUES \
      ('1', 'Dr Nic Williams', 'The Future of Deployment',    \
      '[2012-11-17 11:30, 2012-11-17 12:00)');
    INSERT 0 1

    # INSERT INTO agenda (track, speaker, title, abstract, time, tags) VALUES \
      ('2', 'Armin Ronacher', 'Rust from Python and Ruby', 'Rust is a…',      \
      '[2012-11-17 11:30, 2012-11-17 12:00)', '{"Python", "Ruby", "Erlang"}');
    INSERT 0 1

!SLIDE commandline incremental
    # SELECT track, title, to_char(lower(time), 'HH:MI') AS start, tags FROM agenda;
     track |           title           | start |          tags
    -------+---------------------------+-------+------------------------
     both  | Registration              | 08:45 |
     both  | Keynote                   | 09:30 |
     1     | Elixir                    | 10:15 | {Elixir,Erlang}
     2     | Extendable Django Apps    | 10:15 | {Django,Python}
     both  | Break                     | 10:45 |
     1     | AngularJS                 | 11:00 | {AngularJS,JavaScript}
     2     | JS – from good to great   | 11:00 | {JavaScript}
     1     | The Future of Deployment  | 11:30 |
     2     | Rust from Python and Ruby | 11:30 | {Python,Ruby,Erlang}
    (9 rows)

!SLIDE commandline incremental
    # SELECT track, speaker, title, to_char(lower(time), 'HH:MI') AS start, tags \
      FROM agenda WHERE time @> '2012-11-17 10:20'::timestamptz;
     track |  speaker   |         title          | start |      tags
    -------+------------+------------------------+-------+-----------------
     1     | José Valim | Elixir                 | 10:15 | {Elixir,Erlang}
     2     | Honza Král | Extendable Django Apps | 10:15 | {Django,Python}
    (2 rows)

    # SELECT track, speaker, title, to_char(lower(time), 'HH:MI') AS start, tags \
      FROM agenda WHERE 'Erlang' = ANY(tags) OR 'JavaScript' = ANY(tags);
     track |    speaker     |           title           | start |          tags
    -------+----------------+---------------------------+-------+------------------------
     1     | José Valim     | Elixir                    | 10:15 | {Elixir,Erlang}
     1     | Igor Minár     | AngularJS                 | 11:00 | {AngularJS,JavaScript}
     2     | Olov Lassus    | JS – from good to great   | 11:00 | {JavaScript}
     2     | Armin Ronacher | Rust from Python and Ruby | 11:30 | {Python,Ruby,Erlang}
    (4 rows)

!SLIDE commandline incremental
    # SELECT abstract, abstract::tsvector, to_tsvector('english', abstract) \
      FROM agenda WHERE abstract IS NOT NULL;
             abstract         |         abstract          |         to_tsvector
    --------------------------+---------------------------+-----------------------------
     In this talk, José Valim…| 'Elixir' 'In' 'José'…     | 'also':16 'behind':24…
     I… the challenges and…   | 'I' 'all'… 'challenges'…  | 'base':18 'challeng':22…
     What if you could write… | 'As' 'HTML' 'JavaScript.'…| 'app':8 'code':14 'could':4…
     Is it possible to make…  | 'Is' 'JavaScript' 'Let’s'…| 'care':20 'easier':10…
     Rust… wants to rival C++…| 'C++' 'Erlang,' 'Haskell'…| 'bit':23 'c':10 'design':31…
    (5 rows)

    # SELECT track, speaker, title, lower(time) AS start FROM agenda \
      WHERE abstract::tsvector @@ 'Haskell & Ruby'::tsquery;
     track |    speaker     |           title           |         start
    -------+----------------+---------------------------+------------------------
     2     | Armin Ronacher | Rust from Python and Ruby | 2012-11-17 11:30:00+01
    (1 row)

    # SELECT track, speaker, title, lower(time) AS start FROM agenda         \
      WHERE to_tsvector('english', abstract) @@ to_tsquery('challenging:*');
     track |  speaker   |         title          |         start
    -------+------------+------------------------+------------------------
     2     | Honza Král | Extendable Django Apps | 2012-11-17 10:15:00+01
    (1 row)

!SLIDE bullets incremental
# PostgreSQL
* custom types
* ranges and arrays and search and HStore and JSON and geometry types and PostGIS and XML and MAC+IPv4+IPv6 and UUID and…
* <div class='quote'>I truly believe that PostgreSQL is the hacker’s RDBMS.<br />— Ryan Smith</div>
