use Empresa_PRC;

drop table dbo.iris;
CREATE TABLE dbo.Iris ( SepalLength FLOAT, SepalWidth FLOAT, categoria varchar(10) default null,
PetalLength FLOAT, PetalWidth FLOAT, Name VARCHAR(50) default null );

BULK INSERT dbo.Iris
FROM 'C:\antonio2\TRABAJO\CURSOS\sql_server\repositorio\sql_server\ejemplos_bulk_csv\iris.csv'
WITH (
    FIRSTROW      = 2,
    FIELDTERMINATOR = ';',
    ROWTERMINATOR   = '0x0a',      -- solo LF (Linux)
    CODEPAGE        = '65001',     -- UTF-8
    DATAFILETYPE    = 'char',
    TABLOCK
);

update dbo.iris set name=null;
