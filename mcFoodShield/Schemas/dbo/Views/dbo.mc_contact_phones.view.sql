CREATE VIEW dbo.mc_contact_phones 
/*
************************************************************************************************************************************

       View:  dbo.mc_contact_phones
     Author:  Chris Carson
    Purpose:  portal view of dbo.ContactPhones data

    revisor     date            description
    ---------   -----------     ----------------------------
    ccarson     2013-03-05      refactored to use Core.mc_contact view


    Notes

    This view should eventually be replaced by a Core.mc_contact_phones view

************************************************************************************************************************************
*/
AS 
    SELECT  tp.ContactPhonesID AS id
          , p.phone
          , tc.id AS user_id
          , p.type_id
          , p.edefault
          , p.active
          , p.epublic
          , p.extension
          , p.alert
          , p.is_emergency
      FROM  dbo.ContactPhones AS p
INNER JOIN  dbo.vw_transitionContactPhones AS tp ON tp.id = p.id
                AND tp.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems WHERE systemName = 'mcFoodShield' )
INNER JOIN  Core.mc_contact AS tc ON tc.contactID = p.ContactsID AND tc.portalName = 'mcFoodShield' ;