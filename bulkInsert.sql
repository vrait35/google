# google

--Записываем в файл, команда cmd:
cmd-> bcp booksDB.dbo.books out D:\test1.txt -c -C 1251  -S Anuar\SQLEXPRESS -U anuar_1 -P anuar_1
--юзаем нашу бд:
use booksDB
--создаем копию таблицы books со всеми ограничениями, данные не копируются
select*into bulkTableTest from books where 1<>1
--копируем из файла в нашу таблицу
bulk insert bulkTableTest from 'D:\test1.txt' with(FIRSTROW =100,CODEPAGE=1251)
-- 1251 кирилица

