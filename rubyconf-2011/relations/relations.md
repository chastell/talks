!SLIDE transition=scrollLeft
# sweet relations,<br />how do they work?

!SLIDE center
# a relations example
![relations: actors](relations.actors.png)

!SLIDE center
# a relations example
![relations: actions](relations.actions.png)

!SLIDE bullets incremental transition=scrollLeft
# relations<br />in relational (ha!) databases
* database ‘relations’<br />are between table **rows**
* one-to-many: foreign keys
* many-to-many: join tables
* dereferencing: join queries

!SLIDE bullets incremental
# relations<br />in document databases
* embedded documents
* document identifier references
* MongoDB – implicit DBRef:<br />`{ $ref: <collection>, $id: <object_id> }`
* dereferencing costs | [MongoHydrator](https://github.com/gregspurrier/mongo_hydrator)?

!SLIDE bullets incremental
# relations<br />elsewhere
* key-value stores: explicit
* graph databases: the whole point of
* freely-labeled edges and vertices
* graph traversal!<br />proximity metrics!

!SLIDE center
![graph database](graph-database.png)
[Wikipedia: Graph database](http://en.wikipedia.org/wiki/Graph_database)

!SLIDE bullets incremental transition=scrollLeft
# if relations<br />were objects
* a ‘relations’ table or collection
* very flexible in schema-less databases
* two-step dereferencing:<br />object — its relations — their objects
* tonnes of easily-aggregable data

!SLIDE center
# relations as objects
![relations: object](relations.objects.png)

!SLIDE incremental
# \o/   yay for names!   \o/
* <div class='quote'>There are only two industries that<br />refer to their customers as ‘users’.<br />— Edward Tufte</div>
* <div class='quote'>Calling the table ‘people’, not ‘users’.<br />A small blow in support of humanity.<br />— Paul Battley</div>
* read _[Personal names around the world](http://www.w3.org/International/questions/qa-personal-names)_

!SLIDE center
# relations as objects
![relations: object](relations.objects.png)

!SLIDE center transition=scrollRight
![roses are gray, violets are gray](colours.jpg)
[Kontraband: If Corgis Could Write Love Poems…](http://www.kontraband.com/pics/27528/If-Corgis-Could-Write-Love-Poems)
