exec crear_tabla 'ventas';

delete from categorias where idcategoría=1;

use Empresa_PRC;

declare
@codigo int

begin try
	insert into categorias(idCategoría, nombreCategoría) values(1, 'bebidas2');
end try
begin catch
	set @codigo = @@ERROR;
	print @codigo;
	print error_message()

end catch;


insert into categorias(idCategoría, nombreCategoría) values(1, 'bebidas2');