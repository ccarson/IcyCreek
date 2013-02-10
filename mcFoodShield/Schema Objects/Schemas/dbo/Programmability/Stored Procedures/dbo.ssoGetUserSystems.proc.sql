CREATE PROCEDURE [dbo].[ssoGetUserSystems]  ( 
	@email AS NVARCHAR( 100 ) ) AS
BEGIN

SET NOCOUNT ON;

	SELECT userSystemName, i.legacyID 
	FROM mcCoreShield.dbo.transitionIdentities AS i
	INNER JOIN mcCoreShield.dbo.Contacts AS c ON c.id = i.id
	INNER JOIN mcCoreShield.dbo.transitionSystems AS s
	ON s.id = i.transitionSystemsID
	WHERE c.Email = @email;

END