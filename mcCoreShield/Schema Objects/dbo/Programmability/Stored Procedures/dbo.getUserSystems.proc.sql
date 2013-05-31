CREATE PROCEDURE [dbo].[getUserSystems] ( 
	@email AS NVARCHAR( 100 ) ) AS
BEGIN

SET NOCOUNT ON;

	SELECT userSystemName, i.legacyID FROM dbo.transitionIdentities AS i
	INNER JOIN dbo.Contacts AS c ON c.id = i.id
	INNER JOIN [Reference].Systems AS s
	ON s.id = i.transitionSystemsID
	WHERE c.Email = @email;

END
