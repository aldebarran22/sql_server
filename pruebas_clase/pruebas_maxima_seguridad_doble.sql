

OPEN SYMMETRIC KEY clave1 DECRYPTION BY PASSWORD = 'antonio1';
OPEN SYMMETRIC KEY clave2 DECRYPTION BY PASSWORD = 'antonio2';

select * from usuarios;

--2) Encriptar:
/*
DECLARE @c VARBINARY(MAX);	   -- Ojo MAX tiene 2^31-1
DECLARE @texto NVARCHAR(MAX);  -- Ojo que no sea varchar

SET @texto = 'texto secreto';
SET @c = EncryptByKey(Key_GUID('MiClave'), @texto);
SELECT @c AS Cifrado;*/

SELECT id, 
CONVERT(VARCHAR(200), DecryptByKey(pass1)) AS Desencriptado1,
CONVERT(VARCHAR(200), DecryptByKey(pass2)) AS Desencriptado2
from usuarios;

