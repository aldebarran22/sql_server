
-- Ver los índices:
select * from sys.indexes;

-- Ver los indices de una tabla:
SELECT 
    i.name AS index_name,
    i.index_id,
    i.type_desc,
    i.is_unique,
    i.is_primary_key,
    i.is_unique_constraint,
    c.name AS column_name,
    ic.key_ordinal,
    ic.is_included_column
FROM sys.indexes i
JOIN sys.index_columns ic 
    ON i.object_id = ic.object_id 
   AND i.index_id = ic.index_id
JOIN sys.columns c 
    ON ic.object_id = c.object_id 
   AND ic.column_id = c.column_id
WHERE i.object_id = OBJECT_ID('Pedidos')
ORDER BY i.index_id, ic.key_ordinal;


-- Forzar indices en las consultas:
