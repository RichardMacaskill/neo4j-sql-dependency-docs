
LOAD CSV with headers FROM "file:///WorldWideImportersDep.csv" as row
with row where row._SqlServerInstance_Database_Object_Type = 'Function'
MERGE (f:Function {Name: row._SqlServerInstance_Database_Object_Name,
                   objectId: row._SqlServerInstance_Database_Object_id
})
SET f.url = 'https://cas-testlab-neo4j.co.uk/WWI//pc-cas_dev/User_databases/WideWorldImporters/Programmability/Functions/Table-valued_Functions/'
+ replace(split(row._SqlServerInstance_Database_Object_Name,'.[')[1],']','')
+ '.html';

LOAD CSV with headers FROM "file:///WorldWideImportersDep.csv" as row
with row where row._SqlServerInstance_Database_Object_Type = 'Table'
MERGE (f:Table {Name: row._SqlServerInstance_Database_Object_Name,
                   objectId: row._SqlServerInstance_Database_Object_id
})
SET f.url = 'https://cas-testlab-neo4j.co.uk/WWI//pc-cas_dev/User_databases/WideWorldImporters/Tables/'
+ replace(split(row._SqlServerInstance_Database_Object_Name,'.[')[1],']','')
+ '.html';

//https://cas-testlab-neo4j.co.uk/WWI//pc-cas_dev/User_databases/WideWorldImporters/Tables/Address.html

LOAD CSV with headers FROM "file:///WorldWideImportersDep.csv" as row
with row where row._SqlServerInstance_Database_Object_Type = 'Stored Procedure'
MERGE (f:Procedure {Name: row._SqlServerInstance_Database_Object_Name,
                objectId: row._SqlServerInstance_Database_Object_id
})
SET f.url = 'https://cas-testlab-neo4j.co.uk/WWI//pc-cas_dev/User_databases/WideWorldImporters/Programmability/Stored_Procedures/'
+ replace(split(row._SqlServerInstance_Database_Object_Name,'.[')[1],']','')
+ '.html';

LOAD CSV with headers FROM "file:///WorldWideImportersDep.csv" as row
with row where row._SqlServerInstance_Database_Object_Type = 'Trigger'
MERGE (f:Trigger {Name: row._SqlServerInstance_Database_Object_Name,
                    objectId: row._SqlServerInstance_Database_Object_id
});


LOAD CSV with headers FROM "file:///WorldWideImportersDep.csv" as row
with row where row._SqlServerInstance_Database_Object_Type = 'View'
MERGE (f:View {Name: row._SqlServerInstance_Database_Object_Name,
               objectId: row._SqlServerInstance_Database_Object_id
})
SET f.url = 'https://cas-testlab-neo4j.co.uk/WWI//pc-cas_dev/User_databases/WideWorldImporters/Views/'
+ replace(split(row._SqlServerInstance_Database_Object_Name,'.[')[1],']','')
+ '.html';


LOAD CSV with headers FROM "file:///WorldWideImportersDep.csv" as row
with row where row._SqlServerInstance_Database_Object_Type = 'User Defined Type'
MERGE (f:UserDefinedType {Name: row._SqlServerInstance_Database_Object_Name,
               objectId: row._SqlServerInstance_Database_Object_id
});

// relationships


LOAD CSV with headers FROM "file:///WorldWideImportersDep.csv" as row
MATCH (o {Name: row._SqlServerInstance_Database_Object_Name})
MATCH (o2 {Name: row._SqlServerInstance_Database_Object_UsedBy_Object})
MERGE (o)-[r:USED_BY]->(o2)
RETURN count(*);


LOAD CSV with headers FROM "file:///WorldWideImportersDep.csv" as row
MATCH (o {Name: row._SqlServerInstance_Database_Object_Name})
MATCH (o2 {Name: row._SqlServerInstance_Database_Object_Uses_Object})
MERGE (o)-[r:USES]->(o2)
RETURN count(*);
