# google


create database book_index
use book_index
create table avtor(
id_avtor int primary key identity(1,1),
name varchar(50)
)
create table izdatel(
id_izdatel int primary key identity(1,1),
name varchar(50)
)
create table book(
id_book int primary key identity(1,1),
name varchar(50),
id_avtor int foreign key references avtor(id_avtor),
id_izdatel int foreign key references izdatel(id_izdatel)
)
create table pokupateli(
id_pokupatel int primary key identity(1,1),
name varchar(50),
)
create table prodazhi(
id_prodazha int primary key identity(1,1),
id_book int foreign key references book(id_book),
id_pokupatel int foreign key references pokupateli(id_pokupatel)
)
insert avtor(name) values('Пушкин А.С.')
insert avtor(name) values('Абай Кунанбаев')
insert avtor(name) values('Геродот')

insert izdatel(name) values('Союз')
insert izdatel(name) values('Алматы')
insert izdatel(name) values('Санкт-Петербург')

insert book(name,id_avtor,id_izdatel) values('Стрекоза и муравей',1,3)
insert book(name,id_avtor,id_izdatel) values('Древние ковчеги',3,1)
insert book(name,id_avtor,id_izdatel) values('45 черных слов',2,2)

insert pokupateli(name) values('Малышева О.Л.')
insert pokupateli(name) values('Киркоров А.К.')
insert pokupateli(name) values('Малахов Ф.В.')


insert prodazhi(id_book,id_pokupatel) values(1,2)
insert prodazhi(id_book,id_pokupatel) values(3,1)
insert prodazhi(id_book,id_pokupatel) values(2,1)

create nonclustered index index_1 on avtor(name)

create unique index index_2 on avtor(id_avtor)

select*from prodazhi

select count(id_book)
from prodazhi p

select b.name , i.name
from prodazhi p, book b , pokupateli i  
where p.id_book=2 and p.id_book=b.id_book 
and p.id_pokupatel=i.id_pokupatel

select b.name,i.name,a.name
from
(
select b.id_avtor  as id_avt,b.name as name ,b.id_izdatel as id_zid
from book b
where name='Стрекоза и муравей') as b
inner join avtor a on b.id_avt=a.id_avtor
inner join izdatel i on i.id_izdatel=b.id_zid

select b.name, i.name
from prodazhi p
inner join book  b on  b.id_book=p.id_book
inner join pokupateli i on i.id_pokupatel=p.id_pokupatel

select p.name
from pokupateli p
where name like '%Малы%'

alter table pokupateli
add nickname varchar(50)

update pokupateli set name='Басков Н.А.'
where  name like '%Киркоров%'


select*from prodazhi
insert prodazhi(id_book,id_pokupatel) values
(2,2)
insert prodazhi(id_book,id_pokupatel) values
(3,3)

select*from pokupateli

select*from pokupateli



select x.name,m.kol
from
(select count(p.id_pokupatel) as kol, p.id_pokupatel
from prodazhi p
group by p.id_pokupatel) as m,pokupateli x
where x.id_pokupatel=m.id_pokupatel 
order by m.kol

insert izdatel(name) values('xx')

delete from izdatel where name='xx'
select*from izdatel

select sum(z1.kol) as sum
from
(select count(p.id_pokupatel) as kol, p.id_pokupatel
from prodazhi p
group by p.id_pokupatel) as z1
