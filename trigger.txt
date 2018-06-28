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
--1.Чтобы при взятии определенной книги, ее кол-во уменьшалось на 1. 
create trigger t1
on vzyato
for insert
as
declare @a int
select @a=id_book  from inserted
declare @b int
select @b=kol-1 from books where id_book=@a
update books set kol=@b where id_book=@a 

insert vzyato values(1,2)

--2.Чтобы при возврате определенной книги, ее кол-во увеличивалось на 1.
create trigger t2
on vozvrat
for insert
as
declare @a int
select @a=id_book  from inserted
declare @b int
select @b=kol+1 from books where id_book=@a
update books set kol=@b where id_book=@a 
select*from books

insert vozvrat values(1,2)

--3.Чтобы нельзя было выдать книгу, которой уже нет в библиотеке (по кол-ву).
create trigger t3
on  vzyato
for insert
as
declare @a int
select @a=id_book from inserted
declare @kol int
select @kol=kol from books where id_book=@a 
if @kol<1 begin raiserror('Количество  книг :  %d ',0,1,0)
Rollback transaction
 end

insert vzyato values(5,1)

--4.Чтобы нельзя было выдать более трех книг одному студенту. 

create trigger t4
on vzyato
for insert
as
declare @id_s int
declare @id_kniga int
select @id_s=id_student, @id_kniga=id_book from inserted
declare @kol int
select @kol=count(id_book) from vzyato where id_student=@id_S
if @kol>2 begin 
raiserror('Вы взяли слишком много книг',0,1)
	raiserror('Данные о  вас сохраняться не будут',0,1)
		Rollback transaction
	end
insert vzyato values(1,2)
--5.Чтобы при удалении книги, данные о ней копировались в таблицу Удаленные.
create table udalen(
id_book int foreign key references books(id_book),
kol int
)
create trigger t5
on books
for delete
as  
declare @a int,@k int
select @a=id_book,@k=kol from deleted 
insert udalen  values(@a,@k)
delete from books where id_book=7
--у меня две id связаны, выдает ошибку,
-- но триггер рабочий 
insert books(name) values('Все о соленых огурцах')
--6.Если книга добавляется в базу, она должна быть удалена из таблицы Удаленные.
create trigger t6
on books for insert
as 
declare @a int
select @a=id_book from inserted
delete from udalen where id_book=@a

select*from udalen
select*from books select*from students
select*from vzyato select*from vozvrat
