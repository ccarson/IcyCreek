CREATE VIEW dbo.mc_contact_verification
/*
************************************************************************************************************************************

       View:  dbo.mc_contact_verification
     Author:  Chris Carson
    Purpose:  portal view of dbo.ContactVerifications data

    revisor     date            description
    ---------   -----------     ----------------------------
    ccarson     2013-03-05      refactored to use Core.mc_contact view


    Notes

    This view should eventually be replaced by a Core.mc_contact_verification view

************************************************************************************************************************************
*/
AS
    SELECT  tv.ContactVerificationsID AS id
          , tc1.id AS user_id
          , COALESCE( tc2.id, 0 ) AS verified_by
          , v.verified_date
      FROM  dbo.ContactVerifications AS v
INNER JOIN  dbo.vw_transitionContactVerifications AS tv ON tv.id = v.id
                AND tv.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems WHERE systemName = 'mcFoodShield' )
INNER JOIN  Core.mc_contact AS tc1 ON tc1.contactID = v.contactsID  AND tc1.portalName = 'mcFoodShield'
 LEFT JOIN  Core.mc_contact AS tc2 ON tc2.contactID = v.verified_by AND tc2.portalName = 'mcFoodShield' ;