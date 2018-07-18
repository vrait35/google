# google


create database service_spec_tehnique
use service_spec_tehnique
--таблица пользователей
create table users(
id_user int primary key identity(1,1),
phone varchar(15),
full_name varchar(100),
password varchar(150) 
)
--таблица всех типов
create table type(
id_type int primary key identity(1,1),
name varchar(150), --сутки, часы, газель, топлива-90
name_all varchar(100) -- машины, время, топлива
)

--подача объявления зарегистрированного пользователя
create table give_declaration_zar_user(
id_decl_user int primary key identity(1,1),
id_user int foreign key references users(id_user) not null,
header varchar(500),--zagolovok
type_service int foreign key references type(id_type) not null,
type_tehnique int foreign key references type(id_type)not null,
type_fuel int foreign key references type(id_type) not null, --tip topliva
price int not null,
type_time int foreign key references type(id_type) not null,
gabarit varchar(50),
allow_massa int , --razreshenaya massa,
city varchar(100),
oplata int default 0
)
create table photo_zar(
id_decl_user int foreign key references give_declaration_zar_user(id_decl_user),
photo varchar(100)
)
--trigger insert  в all_decl  (просмотр всех объявлений)


----подача незарегистрированного пользователя
create table give_declaration_nozar_user(
id_decl_user int primary key identity(1,1),
phone varchar(15),
full_name varchar(100),
password varchar(100),
city varchar(150),
price int,
oplata int default 0
)
create table photo_nozar(
id_decl_user int foreign key references give_declaration_nozar_user(id_decl_user),
photo varchar(100)
)

--status decl
create table status(
id_status int primary key identity(1,1),
name varchar(100)
)
insert status(name) values('сохранено')
insert status(name) values('опубликовано')
insert status(name) values('несохранено')
--просмотр всех своих объявлений
create table look_my_decl(
id_user int foreign key references users(id_user),
id_decl_user int foreign key references give_declaration_nozar_user(id_decl_user),
status int foreign key references status(id_status) default 0,
number_day int default 0 -- количество дней
)

--просмотри всех объявлений
create table all_decl(
id_decl int primary key identity(1,1),
city varchar(100),
price int,
phone varchar(100),
photo varchar(100)
)

--триггер добавляющий в таблицу все объявления(all_decl) зарегистрированного пользователя которые оплатили
create trigger trigger_insert__all_decl_insert__look_my_decl
on give_declaration_zar_user
for insert
as
declare @i int
declare @day int,@id_user int, @id_decl_user int
declare @city varchar(100), @phone varchar(15),@photo varchar(100), @price int
select @id_user=id_user from inserted --берем id_user,чтобы посмотреть телефон
select @phone=phone from users where id_user=@id_user
select @i=i.oplata,@city=city, @price=price , @id_decl_user=id_decl_user from inserted i
select @photo =photo from photo_zar where id_decl_user=@id_decl_user
set @day=0
if @i>0 begin 
select @day=@i*1.00/200  -- в день  если будет 200 тенге, смотря  какое будет объявление(топ, обычное, быстро)
insert all_decl(city,phone,photo,price) values(@city,@phone,@photo,@price)
insert look_my_decl(id_decl_user,id_user,number_day,status) values(@id_decl_user,@id_user,@day,1)
end
else begin
insert look_my_decl(id_decl_user,id_user,number_day,status) values(@id_decl_user,@id_user,0,0)
end


--триггер для автоматической регистрации пользователя при добавлении объявления  и в  таблицу все объявления если оплатил
create trigger trigger__give_declaration_nozar_user_
on give_declaration_nozar_user
for insert
as
declare @phone varchar(15),@id_decl_user int
declare @full_name varchar(150),@price int,@day int
declare @password varchar(100),@city varchar(150),@i int,@photo varchar(100)

select @phone =phone,@price=price,
@full_name=full_name,@password=password,@city=city,@i=oplata,@id_decl_user=id_decl_user from inserted
insert users(full_name,password,phone) values(@full_name,@password,@phone)
select @photo=photo from photo_nozar where id_decl_user=@id_decl_user
declare @id_user int
select @id_user=id_user from users where @phone=phone 
if @i>0 begin
set @day=@i*1.00/200
insert all_decl(city,phone,photo,price) values(@city,@phone,@photo,@price)
insert look_my_decl(id_decl_user,id_user,number_day,status) values(@id_decl_user,@id_user,@day,1)
end
else begin
insert look_my_decl(id_decl_user,id_user,number_day,status) values(@id_decl_user,@id_user,0,0)
end



