

-- ENCRIPTACION =======================================================

-- 1) Hay que crear una BD Master Key (solo una vez por BD)
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Antonio123#$';


-- 2) Crear la clave simétrica:
CREATE SYMMETRIC KEY MiClave
WITH ALGORITHM = AES_256
ENCRYPTION BY PASSWORD = 'Antonio123#$';


-- 3) Abrir la clave antes de usarla:
OPEN SYMMETRIC KEY MiClave
DECRYPTION BY PASSWORD = 'Antonio123#$';


--4) Ya se puede cifrar:
SELECT EncryptByKey(Key_GUID('MiClave'), 'texto');


-- DESENCRIPTACION =====================================================

-- 1) Abrir la clave
OPEN SYMMETRIC KEY MiClave
DECRYPTION BY PASSWORD = 'Antonio123#$';

--2) Encriptar:
DECLARE @c VARBINARY(MAX);	   -- Ojo MAX tiene 2^31-1
DECLARE @texto NVARCHAR(MAX);  -- Ojo que no sea varchar

SET @texto = 'texto secreto';
SET @c = EncryptByKey(Key_GUID('MiClave'), @texto);
SELECT @c AS Cifrado;

-- 3) Desencriptar:
SELECT CONVERT(NVARCHAR(200), DecryptByKey(@c)) AS Desencriptado;




