CREATE TABLE [dbo].[ContactSystems] (
    [ID]            UNIQUEIDENTIFIER NOT NULL,
    [systemID]      INT              NOT NULL,
    [accessID]      INT              NULL,
    [expiresOn]     DATETIME2 (7)    NULL,
    [numberOfHits]  INT              NULL,
    [lastLoginOn]   DATETIME2 (7)    NULL,
    [status]        NVARCHAR (20)    NULL,
    [joinedOn]      DATETIME2 (7)    NULL,
    [memberType]    INT              NULL,
    [sysmember]     INT              NULL,
    [isHidden]      BIT              NULL,
    [securityLevel] INT              NULL,
    [folderID]      INT              NULL,
    [createdOn]     DATETIME2 (7)    NULL,
    [createdBy]     UNIQUEIDENTIFIER NULL,
    [updatedOn]     DATETIME2 (7)    NULL,
    [updatedBy]     UNIQUEIDENTIFIER NULL,
    [mc_contactID]  INT              NOT NULL,
    CONSTRAINT [PK_ContactSystems] PRIMARY KEY CLUSTERED ([ID] ASC, [systemID] ASC),
    CONSTRAINT [FK_ContactSystems_Contacts] FOREIGN KEY ([ID]) REFERENCES [dbo].[Contacts] ([ID]),
    CONSTRAINT [FK_ContactSystems_Systems] FOREIGN KEY ([systemID]) REFERENCES [Reference].[Systems] ([id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_ContactSystems_Core]
    ON [dbo].[ContactSystems]([systemID] ASC, [ID] ASC)
    INCLUDE([mc_contactID]);


GO
CREATE NONCLUSTERED INDEX [IX_ContactSystems_mc_contactID]
    ON [dbo].[ContactSystems]([mc_contactID] ASC, [systemID] ASC, [ID] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_ContactSystems_Portal]
    ON [dbo].[ContactSystems]([systemID] ASC, [mc_contactID] ASC)
    INCLUDE([ID]);


GO
CREATE TRIGGER trContactSystems ON dbo.ContactSystems
AFTER INSERT, UPDATE, DELETE
AS 
BEGIN

	IF @@rowcount = 0 RETURN ; 
	
	IF  EXISTS ( SELECT 1 FROM inserted ) 
		 AND 
	    EXISTS ( SELECT 1 FROM deleted ) 
	BEGIN 
		UPDATE dbo.transitionIdentities
		   SET legacyID = i.mc_contactID 
		  FROM inserted AS i 
    INNER JOIN dbo.transitionIdentities AS ti ON ti.ID = i.ID AND ti.transitionSystemsID = i.systemID ; 
		
		RETURN ; 
	END
	
	IF EXISTS ( SELECT 1 FROM inserted ) 
	BEGIN
		INSERT  dbo.transitionIdentities 
		SELECT  id					= ID
			  , transitionSystemsID	= systemID 
			  , convertedTableID	= 1 
  		      , legacyID            = mc_contactID 
  		  FROM  inserted ;
  		RETURN ;
  	END 
     
	IF EXISTS ( SELECT 1 FROM deleted ) 
	BEGIN
		DELETE  dbo.transitionIdentities 
		  FROM  dbo.transitionIdentities AS ti
		 WHERE  EXISTS ( SELECT 1 FROM deleted AS d 
		                  WHERE d.ID = ti.id AND d.systemID = ti.transitionSystemsID ) ;
		RETURN ; 
	END 
	
END