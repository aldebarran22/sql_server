-- Prueba con las funciones:

select convert(int, 'hola');


select idpedido from pedidos where TRY_CONVERT(int, pais) is null;
select TRY_CONVERT(int, 'hola');