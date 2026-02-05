

OPEN SYMMETRIC KEY clave1 DECRYPTION BY PASSWORD = 'antonio1';
OPEN SYMMETRIC KEY clave2 DECRYPTION BY PASSWORD = 'antonio2';

select * from usuarios;


SELECT id, 
CONVERT(VARCHAR(200), DecryptByKey(pass1)) AS Desencriptado1,
CONVERT(VARCHAR(200), DecryptByKey(pass2)) AS Desencriptado2
from usuarios;

