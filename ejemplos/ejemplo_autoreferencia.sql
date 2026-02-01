create table EMP2(Eid int primary key, boss_id int null);
alter table EMP2 add constraint fk_EMP2_Eid 
 foreign key (boss_id) references EMP2(Eid)

insert into EMP2 values(1,null) /*Can't violate constraint as NULL*/
insert into EMP2 values(2,1)    /*Can violate constraint as NOT NULL*/