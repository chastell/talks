```sql
CREATE TABLE temps (
    ts bigint NOT NULL,
    device_key integer NOT NULL,
    value real NOT NULL
) PARTITION BY LIST (device_key);
```

```sql
CREATE FUNCTION create_temps_partition() RETURNS trigger LANGUAGE plpgsql
AS $$
  BEGIN
    EXECUTE format('CREATE TABLE temps_%s PARTITION OF temps FOR VALUES IN (%s)',
                     new.device_key, new.device_key);
    EXECUTE format('CREATE INDEX temps_%s_ts_idx ON temps_%s USING brin (ts)',
                     new.device_key, new.device_key);
    RETURN new;
  END
$$;

CREATE TRIGGER create_temps_partition BEFORE INSERT ON devices
FOR EACH ROW EXECUTE PROCEDURE create_temps_partition();
```
<!-- .element class="fragment" -->
