SET ECHO OFF;
SET FEEDBACK OFF;
SET SERVEROUTPUT ON;
SET VERIFY OFF;
SET PAGES 0;
SET HEAD OFF;

SPOOL D:\Code\audit\Test.sql
SELECT DISTINCT 'SET ECHO OFF;' FROM dba_all_tables;
SELECT DISTINCT 'SET FEEDBACK OFF;' FROM dba_all_tables;
SELECT DISTINCT 'SET SERVEROUTPUT ON;' FROM dba_all_tables;
SELECT DISTINCT 'SET VERIFY OFF;' FROM dba_all_tables;
SELECT DISTINCT 'SET PAGES 0;' FROM dba_all_tables;
SELECT DISTINCT 'SET HEAD OFF;' FROM dba_all_tables;
SELECT DISTINCT 'SPOOL D:\Code\audit\Result.sql' FROM dba_all_tables;
SELECT DISTINCT 'SELECT DISTINCT ''SET ECHO OFF;'' FROM dba_all_tables;
SELECT DISTINCT ''SET FEEDBACK OFF;'' FROM dba_all_tables;
SELECT DISTINCT ''SET SERVEROUTPUT ON;'' FROM dba_all_tables;
SELECT DISTINCT ''SET VERIFY OFF;'' FROM dba_all_tables;
SELECT DISTINCT ''SET PAGES 0;'' FROM dba_all_tables;
SELECT DISTINCT ''SET HEAD OFF;'' FROM dba_all_tables;
SELECT DISTINCT ''SPOOL D:\Code\audit\Update.sql'' FROM dba_all_tables;' FROM dba_all_tables;
SELECT 	 'SELECT ''UPDATE tables SET NbrTuples='',COUNT(*),'' WHERE Nom=trim(''''',
		TABLE_NAME,
		''''') and NomBDD=''''MYBDD'''' and Proprietaire=trim(''''',
		OWNER,
		''''');'' FROM ',
		OWNER,
		'.',
		TABLE_NAME,
		'; SELECT ''UPDATE tables SET NbrAttributs='',COUNT(*),'' WHERE Nom=trim(''''',
		TABLE_NAME,
		''''') and NomBDD=''''MYBDD'''' and Proprietaire=trim(''''',
		OWNER,
		''''');'' FROM DBA_TAB_COLUMNS WHERE TABLE_NAME=trim(''',
		TABLE_NAME,
		''') and OWNER=trim(''',
		OWNER,
		'''); SELECT ''UPDATE tables SET DateCreation=STR_TO_DATE('',CREATED,'',''%d/%M/%y'') WHERE Nom=trim(''''',
		TABLE_NAME,
		''''') and NomBDD=''''MYBDD'''' and Proprietaire=trim(''''',
		OWNER,
		''''');''FROM DBA_OBJECTS WHERE OBJECT_NAME=trim(''',
		TABLE_NAME,
		''') and OWNER=trim(''',
		OWNER,
		''');'
FROM dba_all_tables
WHERE 	OWNER!='SYS' 
		and OWNER!='SYSTEM' 
		and OWNER!='CTXSYS' 
		and OWNER!='DMSYS' 
		and OWNER!='DSSYS' 
		and OWNER!='EXFSYS' 
		and OWNER!='LBACSYS' 
		and OWNER!='MDSYS' 
		and OWNER!='ORDSYS' 
		and OWNER!='TSMSYS';
SELECT DISTINCT 'SELECT DISTINCT ''SPOOL OFF'' FROM dba_all_tables;' FROM dba_all_tables;
SELECT DISTINCT 'SPOOL OFF' FROM dba_all_tables;

SPOOL OFF 
