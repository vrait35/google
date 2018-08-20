# google


--База данных db_anuar_agent, 
--server: A-306-04 (CORP\темирбулата)
--Задания: anuar_finish


-- Делаем резервную копию , название файла  с датой её создания
declare @a varchar(25)
set @a='C:\asd\ti'+CONVERT(varchar(15),CONVERT(date, GETDATE()))+'.bak'
BACKUP DATABASE db_anuar_agent
TO DISK = @a

--Проверяем файл резервной копии,не восстановляя её
declare @q varchar(25)
set @q='C:\asd\ti'+CONVERT(varchar(15),CONVERT(date, GETDATE()))+'.bak'
RESTORE VERIFYONLY  
FROM DISK=@q

----Переносим таблицу в файл с текущей датой _^^_  %date%
EXEC xp_cmdshell   'bcp db_anuar_agent.dbo.aa out c:\asd\qrd%date%.xls -c  -C 1251 -S A-306-04 -U anuar_1 -P anuar_2' 


