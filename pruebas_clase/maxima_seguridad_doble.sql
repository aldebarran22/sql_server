
--create table usuarios(id int, pass1 VARBINARY(MAX), pass2 VARBINARY(MAX));

DROP MASTER KEY;
CLOSE ALL SYMMETRIC KEYS;
DROP SYMMETRIC KEY clave1;
DROP SYMMETRIC KEY clave2;

-- 1) Hay que crear una BD Master Key (solo una vez por BD)
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'antonio';


-- 2) Crear la clave simétrica:
CREATE SYMMETRIC KEY clave1 WITH ALGORITHM = AES_256 ENCRYPTION BY PASSWORD = 'antonio1';
CREATE SYMMETRIC KEY clave2 WITH ALGORITHM = AES_256 ENCRYPTION BY PASSWORD = 'antonio2';

-- 3) Abrir la clave antes de usarla:
OPEN SYMMETRIC KEY clave1 DECRYPTION BY PASSWORD = 'antonio1';
OPEN SYMMETRIC KEY clave2 DECRYPTION BY PASSWORD = 'antonio2';

--4) Ya se puede cifrar:
insert into usuarios values(1, 
EncryptByKey(Key_GUID('clave1'), 'antonio1'),
EncryptByKey(Key_GUID('clave2'), 'antonio2'));



select * from usuarios;

/*
OPEN SYMMETRIC KEY MiClave
DECRYPTION BY PASSWORD = 'Antonio123#$';
SELECT id, CONVERT(NVARCHAR(200), DecryptByKey(dato)) AS dato_descifrado FROM Prueba;
*/