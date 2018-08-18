# google

create database med_cardsDB
use med_cardsDB

--СТРУКТУРА БД:
                     cards
					 1.id_card
					 2.id_person
	 --1--                         --2-- 
	history_operation         history_lie(лежать в больнице)
	1.id_operation		    	  1.id_lie
	2.id_card				          2.id_card
	3.name					          3.name
	4.datetime_begin		      4.datetime_begin
	5.datetime_end			      5.datetime_end
	6.id_hospital			        6.id_hospital
------------------------    ------------------------  
      ^								                ^
	  |									                |
	operation_med					         	lie_med
	1.id_operation					      	1.id_lie
	2.id_medecine(код лекарства)		2.id_medecine(код лекарства)
	3.id_type_med(укол_таблетка)		3.id_type_med(укол_таблетка)

	operation_doc					          	operation_doc
	1.id_operation				         		1.id_lie
	2.id_doctor						          	2.id_doctor

	--3----
	history_visit
	1.id_visit
	2.id_card		
	3.name			
	4.datetime_begin
	5.datetime_end	
	6.id_hospital	
	----------------
	  ^				
	  |				
	visit_med	
	1.id_visit
	2.id_medecine
	3.id_type_med
	
	visit_doc	
	1.id_visit
	2.id_doctor		
	




create table cities(
id_city int primary key identity(1,1),
name varchar(50)
)
create table persons(
id_person int primary key identity(1,1),
First_name varchar(50),
Last_name varchar(50),
phone varchar(15),
id_city int foreign key references cities(id_city)
)
create table hospitals(
id_hospital int primary key identity(1,1),
name varchar(50),
id_city int foreign key references cities(id_city)
)
create table doctors(
id_doctor int primary key identity(1,1),
First_name varchar(50),
Last_name varchar(50),
id_city int foreign key references cities(id_city),
id_hospital int foreign key references hospitals(id_hospital)
)
create table type_med(
id_type_med int primary key identity(1,1),
name varchar(50)
)
create table medecines(
id_medecine int primary key identity(1,1),
name varchar(50)
)
--cards
create table cards(
id_card int primary key identity(1,1),
id_person int foreign key references persons(id_person))
--History operation
create table history_operation(
id_operation int primary key identity(1,1),
id_card int foreign key references cards(id_card),
name varchar(50),
datetime_begin datetime,
datetime_end datetime,
id_hospital int foreign key references hospitals(id_hospital)
)

 create table operation_med(
 id_operation int foreign key references history_operation(id_operation),
 id_medecine int foreign key references medecines(id_medecine),
 id_type_med int foreign key references type_med(id_type_med)
 )
 create table operation_doc(
 id_operation int foreign key references history_operation(id_operation),
 id_doctor int foreign key references  doctors(id_doctor)
 )
--history_lie
create table history_lie(
id_lie int primary key identity(1,1),
id_card int foreign key references cards(id_card),
name varchar(50),
datetime_begin datetime,
datetime_end datetime,
id_hospital int foreign key references hospitals(id_hospital)
)

 create table lie_med(
 id_lie int foreign key references history_lie(id_lie),
 id_medecine int foreign key references medecines(id_medecine),
 id_type_med int foreign key references type_med(id_type_med)
 )
 create table lie_doc(
 id_operation int foreign key references history_lie(id_lie),
 id_doctor int foreign key references  doctors(id_doctor)
 )
 --history_visit
create table history_visit(
id_visit int primary key identity(1,1),
id_card int foreign key references cards(id_card),
name varchar(50),
datetime_begin datetime,
datetime_end datetime,
id_hospital int foreign key references hospitals(id_hospital)
)

 create table visit_med(
 id_visit int foreign key references history_visit(id_visit),
 id_medecine int foreign key references medecines(id_medecine),
 id_type_med int foreign key references type_med(id_type_med)
 )
 create table visit_doc(
 id_visit int foreign key references history_visit(id_visit),
 id_doctor int foreign key references  doctors(id_doctor)
 )







