declare @n char(1)
set @n = char(10)

declare @stmt nvarchar(max)

DECLARE @statments TABLE (stmt varchar(max) NOT NULL)

-- procedures
INSERT INTO @statments(stmt)  
select 'drop procedure [' + schema_name(schema_id) + '].[' + name + ']' 
from sys.procedures


-- check constraints
INSERT INTO @statments(stmt)  
select 	'alter table [' + schema_name(schema_id) + '].[' + object_name( parent_object_id ) + ']    drop constraint [' + name + ']'
from sys.check_constraints

-- functions
INSERT INTO @statments(stmt)  
select 'drop function [' + schema_name(schema_id) + '].[' + name + ']'
from sys.objects
where type in ( 'FN', 'IF', 'TF' )

-- views
INSERT INTO @statments(stmt)  
select 'drop view [' + schema_name(schema_id) + '].[' + name + ']'
from sys.views

-- foreign keys
INSERT INTO @statments(stmt)  
select   'alter table [' + schema_name(schema_id) + '].[' + object_name( parent_object_id ) + '] drop constraint [' + name + ']'
from sys.foreign_keys

INSERT INTO @statments(stmt)  
select 'IF OBJECTPROPERTY(OBJECT_ID(''[' + schema_name(schema_id) + '].[' + name + ']''), ''TableTemporalType'') = 2 ' +
	'   ALTER TABLE [' + schema_name(schema_id) + '].[' + name + '] SET (SYSTEM_VERSIONING = OFF) '
from sys.tables

-- tables
INSERT INTO @statments(stmt)  
select 'drop table [' + schema_name(schema_id) + '].[' + name + ']'
from sys.tables

-- user defined types
INSERT INTO @statments(stmt)  
select 'drop type [' + schema_name(schema_id) + '].[' + name + ']'
from sys.types
where is_user_defined = 1

select * from @statments

select @stmt = STRING_AGG(stmt, '; ') FROM @statments

select @stmt

exec sp_executesql @stmt