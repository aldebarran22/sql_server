-- Prueba de la función que comprueba si existe o no un socio en la BD.

print dbo.func_user2('','')
print dbo.func_user2('admin','')
print dbo.func_user2('admin','admin')
