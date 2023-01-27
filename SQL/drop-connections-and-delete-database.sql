USE master;
Go

declare @n char(1)
set @n = char(10)
Declare @DropSql nvarchar(max)

DECLARE @statments TABLE (stmt varchar(max) NOT NULL)

INSERT INTO @statments(stmt)  
SELECT 'kill ' + CONVERT(varchar(5), session_id) + ';'  
FROM sys.dm_exec_sessions s
JOIN sys.databases  d on s.database_id = d.database_id
WHERE len(name) =  32 OR len(name) = (32+16) OR LEN(NAME) = (32+14)

INSERT INTO @statments(stmt)  
SELECT 'DROP DATABASE ['+ name + ']' 
FROM sys.databases WHERE len(name) =  32 OR len(name) = (32+16) OR LEN(NAME) = (32+14)


select @DropSql = STRING_AGG(stmt, '; ') FROM @statments

exec sp_executesql @DropSql