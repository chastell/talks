![overflow](img/overflow.gif) <!-- .element style="width: 28%" -->


# upserts

```sql
CREATE TABLE devices (
    device_key serial PRIMARY KEY,
    name text NOT NULL UNIQUE,
    last_temp real NOT NULL
);
```
<!-- .element class="fragment" -->

```no-highlight
┌────────────┬─────────┬──────────┬─────────────────────────────────────────────┐
│   Column   │  Type   │ Nullable │                   Default                   │
├────────────┼─────────┼──────────┼─────────────────────────────────────────────┤
│ device_key │ integer │ not null │ nextval('devices_device_key_seq'::regclass) │
│ name       │ text    │ not null │                                             │
│ last_temp  │ real    │ not null │                                             │
└────────────┴─────────┴──────────┴─────────────────────────────────────────────┘
Indexes:
    "devices_pkey" PRIMARY KEY, btree (device_key)
    "devices_name_key" UNIQUE CONSTRAINT, btree (name)
```
<!-- .element class="fragment" -->


```sql
INSERT INTO devices (name, last_temp) VALUES ('Warsaw', 7)
ON CONFLICT (name) DO UPDATE SET last_temp = excluded.last_temp;
```

```no-highlight
┌────────────┬────────┬───────────┐
│ device_key │  name  │ last_temp │
├────────────┼────────┼───────────┤
│          1 │ Warsaw │         7 │
└────────────┴────────┴───────────┘
```
<!-- .element class="fragment" -->

```sql
INSERT INTO devices (name, last_temp) VALUES ('Warsaw', 6)
ON CONFLICT (name) DO UPDATE SET last_temp = excluded.last_temp;
```
<!-- .element class="fragment" -->

```sql
INSERT INTO devices (name, last_temp) VALUES ('Warsaw', 5)
ON CONFLICT (name) DO UPDATE SET last_temp = excluded.last_temp;
```
<!-- .element class="fragment" -->

```sql
INSERT INTO devices (name, last_temp) VALUES ('Prague', 8)
ON CONFLICT (name) DO UPDATE SET last_temp = excluded.last_temp;
```
<!-- .element class="fragment" -->

```no-highlight
┌────────────┬────────┬───────────┐
│ device_key │  name  │ last_temp │
├────────────┼────────┼───────────┤
│          1 │ Warsaw │         5 │
│          4 │ Prague │         8 │
└────────────┴────────┴───────────┘
```
<!-- .element class="fragment" -->
