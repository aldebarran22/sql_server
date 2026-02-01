SELECT    p.id
 , p.nombre
 , p.provincia
 , v.id
 , v.descripcion
FROM  
 personaje p
  INNER JOIN
(
    SELECT    provincia.id
     , provincia.descripcion
    FROM      provincia
) AS v ON p.provincia = v.id;