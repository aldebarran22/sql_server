
--Calcular el sueldo final del profesor:

select codProfe, nombreProfe, sueldo, dbo.func_user4(codprofe) as sueldo_final from dbo.Profesores