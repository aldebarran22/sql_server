-- PARA MOVER LA BD TEMPDB A LA UNIDAD D: CUANDO HAY POCO ESPACIO

use master;
go

alter database tempdb
modify file (name=tempdev, filename='D:\SQL2022\TempDB\tempdb.mdf');
go

alter database tempdb
modify file (name=templog, filename='D:\SQL2022\TempDB\templog.ldf');
go
