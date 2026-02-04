

declare @i int
declare @cargo float

set @i = 1


while @i < 10
	begin
	if (@i = 5)
		break
	print @i
	set @i = @i + 1
end