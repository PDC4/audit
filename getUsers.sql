SET ECHO OFF;
SET FEEDBACK OFF;
SET SERVEROUTPUT ON;
SET VERIFY OFF;
SET PAGES 0;
SET HEAD OFF;

SPOOL D:\Code\audit\TestUsers.sql
Select 'INSERT INTO users VALUES (trim(''', USERNAME, '''),''MYBDD'') ;' FROM all_users;
SPOOL OFF 