-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[audit_logins_trigger]
   ON  [dbo].[audit_logins]
   INSTEAD OF INSERT
AS 
BEGIN
	SET NOCOUNT ON;

	INSERT INTO dbo.audit_logins ( 
		sLogin, sPassword, dLogged, sIPAddress )
	SELECT sLogin, N'authFail', dLogged, sIPAddress
	FROM inserted WHERE sPassword <> N'authok';
	
	INSERT INTO dbo.audit_logins ( 
		sLogin, sPassword, dLogged, sIPAddress )
	SELECT sLogin, sPassword, dLogged, sIPAddress
	FROM inserted WHERE sPassword = N'authok';
		
END
