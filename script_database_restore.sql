-- change database to master
USE [master] 
GO 

ALTER DATABASE DataBaseName SET ONLINE 
GO

ALTER LOGIN [Connected_User_login] WITH DEFAULT_DATABASE=[master]
GO

-- Change the database connected users status to rollback 

ALTER DATABASE DataBaseName SET MULTI_USER WITH ROLLBACK IMMEDIATE;

Alter Database DataBaseName
  SET SINGLE_USER With ROLLBACK IMMEDIATE

-- restore database
 
  RESTORE DATABASE DataBaseName
  FROM DISK = 'C:\temp\backupName.bak' -- backup file

