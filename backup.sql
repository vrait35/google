--создание устройства резеврного копирования
Execute sp_addumpdevice 'disk', 'myback_1', 'd:\myback.bak'

--резевное копирование
BACKUP DATABASE bibl TO myback_1 

--восстановление базы данных books с перезаписью
RESTORE DATABASE bibl FROM myback_1 WITH REPLACE

--проверка базы данных 
DBCC CHECKDB ('bibl') WITH ALL_ERRORMSGS

--Разностное резервное копирование
BACKUP DATABASE bibl TO myback_1 WITH DIFFERENTIAL, NOINIT

--восстановление базы данных books с перезаписью
RESTORE DATABASE bibl FROM myback_1 WITH REPLACE

/*Создание резервной копии журнала транзакций*/
BACKUP DATABASE bibl TO myback_1 

BACKUP LOG bibl TO myback_1 

RESTORE DATABASE bibl FROM myback_1 WITH REPLACE

--проверка базы данных 
DBCC CHECKDB ('bibl') WITH ALL_ERRORMSGS
