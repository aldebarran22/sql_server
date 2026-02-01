USE master;
GO

ALTER DATABASE tempdb 
MODIFY FILE (NAME = tempdev, FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\tempdb.mdf');
GO

ALTER DATABASE tempdb 
MODIFY FILE (NAME = templog, FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\templog.ldf');
GO
