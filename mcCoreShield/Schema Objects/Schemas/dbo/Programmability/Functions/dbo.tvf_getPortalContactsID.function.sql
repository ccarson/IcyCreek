CREATE FUNCTION dbo.tvf_getPortalContactsID ( @id       AS UNIQUEIDENTIFIER
                                            , @systemID AS INT )
RETURNS TABLE
AS
/*
************************************************************************************************************************************
            
   Function:    dbo.tvf_getPortalContactsID
     Author:    Chris Carson
    Purpose:    returns a portal dbo.mc_contact.id given a coreSHIELD.dbo.Contacts.ID and system id

    revisor    date            description
    ---------  -----------     ----------------------------
    ccarson    2012-09-01      Created

Function Arguments:
    @id         UNIQUEIDENTIFIER    dbo.Contacts.id
    @systemID   INT                 portal systemID

************************************************************************************************************************************
*/
RETURN

    SELECT  mc_contactID = ISNULL(ContactsID, 0)
      FROM  dbo.vw_transitionContacts
     WHERE  id = @id AND transitionSystemsID = @systemID ;

