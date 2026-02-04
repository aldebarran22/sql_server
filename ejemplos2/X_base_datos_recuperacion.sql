-- RECUPERACION DE LA BD:
-- hay veces que al arrancar SSMS nos podemos encontrar una base de datos en recuperación

-- Se puede realizar esta query:
SELECT name, state_desc, recovery_model_desc
FROM sys.databases;

-- esquema del sistema: sys, uno por Base de datos

-- ABRIR DENTRO DEL SERVIDOR carpeta Administración -> Registro de SQL Server -> Actual (podemos ver el arranque de cada BD)


SELECT name, state_desc
FROM sys.databases
WHERE name = 'Empresa_PRC';


-- Ver el estado real de la BD:
SELECT 
    name,
    state,
    state_desc,
    user_access_desc,
    is_in_standby,
    recovery_model_desc
FROM sys.databases
WHERE name = 'Empresa_PRC';


-- Prueba de la BD:
select top 10 * from clientes;