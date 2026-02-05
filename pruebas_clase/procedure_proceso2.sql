

create or alter procedure proceso2(@num1 int, @num2 int)
as


exec dbo.proceso1 @num1, @num2;
print 'En el proceso2';

go