SELECT count(WWV_COLUMN_EXCEPTIONS.TABLE8NAME) AS nbr_doublons FROM APEX_030200.WWV_COLUMN_EXCEPTIONS HAVING COUNT (WWV_COLUMN_EXCEPTIONS.TABLE_NAME) >1;