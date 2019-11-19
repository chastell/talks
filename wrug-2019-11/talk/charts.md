![temperature](img/temperature.gif) <!-- .element style="width: 50%" -->


# charts

* data size / column order
<!-- .element class="fragment" -->

```sql
CREATE TABLE temps (
    ts bigint NOT NULL,
    device_key integer NOT NULL,
    value real NOT NULL
);
```
<!-- .element class="fragment" -->

* index size
<!-- .element class="fragment" -->

```sql
ALTER TABLE temps ADD CONSTRAINT temps_pkey PRIMARY KEY (device_key, ts);
```
<!-- .element class="fragment" -->
