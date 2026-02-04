

create or alter procedure getTotal(@pais varchar(30), @total[money] output) as
declare
	select @total = sum(cargo) from pedidos where 
go