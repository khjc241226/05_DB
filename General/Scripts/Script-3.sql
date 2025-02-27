ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

SELECT 
   V$SESSION.SID || ',' || V$SESSION.SERIAL#
  ,V$SESSION.SID
  ,V$SESSION.SERIAL#
  ,V$SESSION.USERNAME
  ,DBA_OBJECTS.OBJECT_NAME
  ,V$SESSION.SADDR
  ,V$SESSION.OSUSER
  ,V$SESSION.PROGRAM
FROM V$LOCKED_OBJECT
LEFT JOIN DBA_OBJECTS
ON V$LOCKED_OBJECT.OBJECT_ID = DBA_OBJECTS.OBJECT_ID
LEFT JOIN V$SESSION
ON V$LOCKED_OBJECT.SESSION_ID = V$SESSION.SID
ORDER BY 
  V$SESSION.SID,
  DBA_OBJECTS.OBJECT_NAME;