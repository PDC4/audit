SET ECHO OFF;
SET FEEDBACK OFF;
SET SERVEROUTPUT ON;
SET VERIFY OFF;
SET PAGES 0;
SET HEAD OFF;

SPOOL D:\Code\audit\TestTable.sql
Select 'INSERT INTO tables (NomTable, Proprietaire, NomBDD) VALUES (trim(''', TABLE_NAME,'''), trim(''', OWNER,'''), ''MYBDD'') ;' FROM dba_all_tables
WHERE 	OWNER!='SYS' 
		and OWNER!='SYSTEM' 
		and OWNER!='CTXSYS' 
		and OWNER!='DMSYS' 
		and OWNER!='DSSYS' 
		and OWNER!='EXFSYS' 
		and OWNER!='LBACSYS' 
		and OWNER!='MDSYS' 
		and OWNER!='ORDSYS' 
		and OWNER!='TSMSYS' ;
SPOOL OFF 




