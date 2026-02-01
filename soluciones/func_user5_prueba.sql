
--Calcular el sueldo final del profesor:
use Academia;
select codProfe, nombreProfe, sueldo, dbo.func_user5(codprofe) as sueldo_final from dbo.Profesores