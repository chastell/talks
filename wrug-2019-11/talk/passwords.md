![passwords](img/passwords.gif) <!-- .element style="width: 25%" -->


# passwords

```sql
INSERT INTO people (email, password)
VALUES ('person@example.com', crypt('WRUG2019', gen_salt('bf')));
```
<!-- .element class="fragment" -->

```
all_hands=# TABLE people;
┌───────────────────────────┬────────────────────┬───────────────────────────────┐
│         person_id         │       email        │           password            │
├───────────────────────────┼────────────────────┼───────────────────────────────┤
│ b40f6a2e-9a61-4d0d-9083-4…│ person@example.com │ $2a$06$6LEVFo/NyHf0BigXuZ2ETe…│
└───────────────────────────┴────────────────────┴───────────────────────────────┘
```
<!-- .element class="fragment" -->

```sql
SELECT EXISTS(
  SELECT * FROM people
  WHERE email = 'person@example.com' AND password = crypt('WRUG2019', password)
) AS "exists";
```
<!-- .element class="fragment" -->
