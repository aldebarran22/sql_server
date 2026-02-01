
CREATE PROCEDURE dbo.proc2
	@idsocio int
AS
BEGIN
	-- comprobar si existe el socio en la BD.
	if exists (select id from dbo.socios where id = @idsocio)
		begin
			-- El socio existe en la BD

			if exists(select * from information_schema.TABLES where table_name = 'socios_historico')
				-- Si existe la tabla del historico
				insert into dbo.socios_historico(login, password) 
						select login, password from dbo.socios where id = @idsocio

			else
				begin
					-- Si no existe la tabla del historico se crea
					select * into dbo.Socios_historico from dbo.Socios where id = @idsocio		
				end
				
			-- Eliminar el socio de la tabla
			delete from dbo.socios where id = @idsocio
			print 'Eliminado el socio ' + convert(nvarchar(20), @idsocio)
		end
			
	else
		print 'El socio no se encuentra en la BD'
END
GO
