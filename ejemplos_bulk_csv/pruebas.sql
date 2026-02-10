use Empresa_PRC;

drop table dbo.iris;
CREATE TABLE dbo.Iris ( SepalLength FLOAT, SepalWidth FLOAT, PetalLength FLOAT, PetalWidth FLOAT, Name VARCHAR(50) );

BULK INSERT dbo.Iris
FROM 'D:\antonio2\TRABAJO\CURSOS\BASES DE DATOS\SQL_SERVER\repositorio\ejemplos_bulk_csv\iris.csv'
WITH (
    FIRSTROW      = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR   = '0x0a',      -- solo LF (Linux)
    CODEPAGE        = '65001',     -- UTF-8
    DATAFILETYPE    = 'char',
    TABLOCK
);
