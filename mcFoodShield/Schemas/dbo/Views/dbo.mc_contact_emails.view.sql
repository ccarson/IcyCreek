CREATE VIEW dbo.mc_contact_emails
/*
************************************************************************************************************************************

       View:  dbo.mc_contact_emails
     Author:  Chris Carson
    Purpose:  portal view of dbo.ContactEmails data

    revisor     date            description
    ---------   -----------     ----------------------------
    ccarson     2013-03-05      refactored to use Core.mc_contact view


    Notes

    This view should eventually be replaced by a Core.mc_contact_emails view

************************************************************************************************************************************
*/
AS

    SELECT  te.ContactEmailsID AS id
          , e.email
          , mcc.id AS user_id
          , e.type_id
          , e.edefault
          , e.active
          , e.epublic
          , e.alert
          , e.is_emergency
      FROM  dbo.ContactEmails AS e
INNER JOIN  dbo.vw_transitionContactEmails AS te ON e.id = te.id
            AND te.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems WHERE systemName = 'mcFoodShield' )
INNER JOIN  Core.mc_contact AS mcc ON e.contactsID = mcc.contactID AND mcc.portalName = 'mcFoodShield' ;