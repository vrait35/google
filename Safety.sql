# google

create database bibl
use bibl
create table books(
id_book int primary key identity(1,1),
name varchar(50),
kol int
)
create table students(
id_student int primary key identity(1,1),
name varchar(50)
)
create table vzyato(
id_book int foreign key references books(id_book),
id_student int foreign key references students(id_student),
)
create table vozvrat(
id_book int foreign key references books(id_book),
id_student int foreign key references students(id_student),
)
insert books(name) values('Стрикоза и муравей')
insert books(name) values('Ну погоди')
insert books(name) values('Золушка')
insert books(name) values('Энциклопедия о всем')
insert books(name) values('Словарь для русского языка')
insert books(name) values('Математические задачи')
insert students(name) values('Петрович А.Е.')
insert students(name) values('Рохина Е.А.')
insert students(name) values('Шишкин Д.Р.')
insert vzyato values(1,2)
insert vzyato values(6,3)
insert vzyato values(3,3)
insert vzyato values(5,1)
insert vozvrat values(2,1)


------------

CREATE LOGIN Teacher  
    WITH PASSWORD = '340$Uuxwp7Mcxo7Khy';  

	CREATE LOGIN librar   
    WITH PASSWORD = '340$Uuxwp7Mcxo7Khy';  

	CREATE LOGIN adminis
    WITH PASSWORD = '340$Uuxwp7Mcxo7Khy'; 




CREATE USER user_Teacher FOR LOGIN Teacher
	CREATE USER user_librar FOR LOGIN librar
	CREATE USER user_adminis FOR LOGIN adminis


execute sp_addrolemember @membername='user_librar',
	@rolename='db_datawriter'

create view look_students_take_books as
	select b.name as bname , s.name as sname from vzyato v
	inner join students s on s.id_student=v.id_student
	inner join books b on b.id_book=v.id_book

	execute sp_addrolemember @membername='user_Teacher',
	@rolename='db_datareader' 

	execute sp_addrolemember @membername='user_Teacher',
	@rolename='db_datawriter' 

	execute sp_addrolemember @membername='user_adminis',
	@rolename='db_accessadmin' 
