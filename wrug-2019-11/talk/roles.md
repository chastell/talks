![office](img/office.gif)


# roles

```sql
CREATE TYPE role AS ENUM ('viewer', 'proofreader', 'editor', 'editor-in-chief');
```
<!-- .element class="fragment" -->

```sql
CREATE TABLE people (
    person_id uuid DEFAULT gen_random_uuid() NOT NULL UNIQUE,
    email text NOT NULL UNIQUE,
    password text NOT NULL
);
```
<!-- .element class="fragment" -->

```sql
CREATE TABLE pods (
    pod_id uuid DEFAULT gen_random_uuid() NOT NULL UNIQUE,
    role role NOT NULL,
    client_ids uuid[] DEFAULT '{}'::uuid[] NOT NULL,
    people_ids uuid[] DEFAULT '{}'::uuid[] NOT NULL,
    name text DEFAULT ''::text NOT NULL UNIQUE
);
```
<!-- .element class="fragment" -->


# roles

```sql
CREATE TYPE role AS ENUM ('viewer', 'proofreader', 'editor', 'editor-in-chief');
```

```sql
SELECT max(role)
FROM pods
INNER JOIN people ON person_id = ANY(people_ids)
WHERE email = 'person@example.com'
  AND 'a0ef40a0-e1df-0137-262b-4ccc6a81863f' = ANY(client_ids);
```
<!-- .element class="fragment" -->
