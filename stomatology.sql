# google

create table contacts(
id int primary key identity(1,1),
tel1 varchar(50),
tel2 varchar(50),
adress varchar(50)
)
create table doctors(
doctor_type int primary key identity(1,1),
full_name varchar(50),
doctor_type_name varchar(50),
phone varchar(50)
)
create table to_register_in_consultation(
id int primary key identity(1,1),
full_name varchar(50),
phone varchar(50),
doctor_type int foreign key references doctors(doctor_type),
email varchar(100)
)

create table our_services(
id int primary key identity(1,1),
name varchar(100),
photo varchar(100),
text varchar(1500)
)
insert our_services(name,photo,text) values('general_dentistry','qwe.jpg','text1')
insert our_services(name,photo,text) values('cosmetic_dentistry','qwe23.jpg','text2')
insert our_services(name,photo,text) values('dental_implant','qwe86.jpg','text3')
insert our_services(name,photo,text) values('teeth_whitening','qwe34.jpg','text4')

create table our_patients_say(
id int primary key identity(1,1),
full_name_patient varchar(50),
photo_patient varchar(50),
text varchar(50)
)
create table our_team(
id  int foreign key references doctors(doctor_type),
text varchar(50)
)
create table news(
id  int primary key identity(1,1),
name_news varchar(50),
photo_news varchar(50),
text varchar(50),
date varchar(50)
)
insert doctors(full_name,doctor_type_name) values('Борис Федорович Андреев','Хирург')
insert doctors(full_name,doctor_type_name) values('Федор Андреевич Борисов','Стоматолог')
insert doctors(full_name,doctor_type_name) values('Андрей Борисович Федоров','Дерматолог')

insert contacts(tel1,tel2,adress) values('87070543456','87472347895','Пушкина 21')



insert to_register_in_consultation(full_name,phone,doctor_type,email) values('Саша','87058362849',2,'asd@mail.ru')
insert to_register_in_consultation(full_name,phone,doctor_type,email) values('Паша','87021162430',1,'hfg@bk.ru')


insert our_patients_say(full_name_patient,photo_patient,text) values('Aркадий','asd.png','Даже боли не почуствовал')
insert our_team(id,text) values(1,'Приходите, лечите свои зубы с улыбкой')
insert our_team(id,text) values(2,'Здоровье не купишь')

insert news(date,name_news,photo_news,text) values('16-07-2018','День открытых дверей!','qwe.jpg','круто было')
