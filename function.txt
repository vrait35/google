# google

use booksDB
select*from books
--1.	Функцию, возвращающую количество книг,
-- у которых не указана категория.
create function f1()
returns int
as  begin
declare @cnt int
select @cnt=count(t.r) 
from (select isnull(id_category,-1) as r from books)as t
where t.r=-1
return @cnt
end
select dbo.f1() 
declare @c int
execute f1
raiserror('Число %s',4,4,@c)

--2.	Функцию, возвращающую количество книг по каждому
-- издательству и по каждой из тематик.
use booksDB
select*from books
select*from press
select*from themes

create function f2(@izd varchar(50), @thema varchar(50))
returns int
as begin
declare @res int
declare @id_izd int,@id_thema int
select @id_izd=id from press where name=@izd
select @id_thema=id from  themes where name=@thema
select @res=count(Name) from books where id_press=@id_izd and
id_theme=@id_thema 
return @res
end

select*from books
select*from press
select*from themes


select  dbo.f2 ('BHV С.-Петербург','Использование ПК в целом')
--3.	Функцию, возвращающую список книг, отвечающих набору критериев
--(например, название книги, тематика, категория, издательство),
-- и отсортированный по номеру поля, указанному в 5-м параметре, 
-- в направлении, указанном в 6-м параметре.
--  Зачем передавать имя книги?
create function f3( @thema varchar(50), @category varchar(50),@press varchar(50))
returns @t table(name varchar(50),code int)
as begin
declare @id_izd int, @id_thema int,@id_cat int
select @id_izd  =id   from press where name=@press
select @id_thema=id from  themes where name=@thema
select @id_cat  =id   from category where name=@category
insert @t select name,Code from books where Id_press=@id_izd and 
		  Id_theme=@id_thema and id_category=@id_cat   
return
end				

select*from books
select*from press
select*from themes
select*from category		 
select * from f3 ('Программирование','C&C++','BHV С.-Петербург')

--4.	Функцию, возвращающую минимальное из трех переданных параметров.

create function f4(@a1 int,@a2 int,@a3 int)
returns int
as begin
declare @res int
select @res=@a1
if(@res>@a2) begin select @res=@a2 end
if(@res>@a3) begin select @res=@a3 end
return @res
end

select dbo.f4(1,2,3)

--5.	Функцию, которая принимает в качестве параметра двухразрядное число
-- и определяет какой из разрядов больше, либо они равны 
-- (используйте % - деление по модулю. Например, 57%10=7).

create function f5(@a int)
returns int
as begin
declare @a1 int, @a2 int
select @a1=@a/10
select @a2=@a%10
if(@a1>@a2) return 1
if(@a2>@a1) return 2
return 0
end

select dbo.f5(55)

