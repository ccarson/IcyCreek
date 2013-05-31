CREATE VIEW dbo.mc_contact_notes
/*
************************************************************************************************************************************

       View:  dbo.mc_contact_notes
     Author:  Chris Carson
    Purpose:  portal view of dbo.ContactNotes data

    revisor     date            description
    ---------   -----------     ----------------------------
    ccarson     2013-03-05      refactored to use Core.mc_contact view


    Notes

    This view should eventually be replaced by a Core.mc_contact_notes view

************************************************************************************************************************************
*/
AS

    SELECT  tn.ContactNotesID AS id
          , tc1.id AS user_id
          , n.notes
          , COALESCE( tc2.id, 0 ) AS admin_id
          , n.dateAdded
          , n.type_id
      FROM  dbo.ContactNotes AS n
INNER JOIN dbo.vw_transitionContactNotes AS tn ON n.id = tn.id
                AND tn.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems WHERE systemName = 'mcFoodShield' )
INNER JOIN Core.mc_contact AS tc1 ON n.ContactsID = tc1.contactID AND tc1.portalName = 'mcFoodShield'
 LEFT JOIN Core.mc_contact AS tc2 ON n.adminID    = tc2.contactID AND tc2.portalName = 'mcFoodShield' ;