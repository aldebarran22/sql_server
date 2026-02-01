
select Empresa.dbo.Proveedores.NombreContacto as Contacto, 'Empresa' as Concepto from Empresa.dbo.Proveedores
union 
select Academia.dbo.Alumnos.NombreAlum, 'Academia' as Concepto
from Academia.dbo.Alumnos
