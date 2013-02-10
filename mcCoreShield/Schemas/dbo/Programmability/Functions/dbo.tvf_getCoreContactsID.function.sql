CREATE FUNCTION dbo.tvf_getCoreContactsID ( @mc_contactID AS INT
                                          , @systemID     AS INT )
RETURNS TABLE
AS
/*
************************************************************************************************************************************
            
   Function:    dbo.tvf_getCoreContactsID
     Author:    Chris Carson
    Purpose:    given a legacy dbo.mc_contact.id and system id, returns the coreSHIELD.dbo.Contacts.id


    Revision History:
    revisor     date            description
    ---------   -----------     ----------------------------
    ccarson     2012-09-01      Created


Function Arguments:
    @mc_contactID    INT        portal dbo.mc_contact.id
    @systemID        INT        mcCoreShield.dbo.transitionSystems.ID

************************************************************************************************************************************
*/
RETURN

    SELECT  contactsID = id
          , systemID   = transitionSystemsID
      FROM  dbo.vw_transitionContacts
     WHERE  ContactsID            = ISNULL( @mc_contactID, ContactsID )  
       AND  transitionSystemsID   = ISNULL( @systemID, transitionSystemsID ) ;
