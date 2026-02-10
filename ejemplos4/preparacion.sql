-- preparacion para un deadlock

create table dbo.testdeadlock (id int, valor varchar(50));

insert into dbo.testdeadlock values (1,'A'), (2, 'B');