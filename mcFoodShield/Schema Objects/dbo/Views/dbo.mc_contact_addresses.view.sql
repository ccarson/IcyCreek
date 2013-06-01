CREATE VIEW dbo.mc_contact_addresses
/*
************************************************************************************************************************************

       View:  dbo.mc_contact_addresses
     Author:  Chris Carson
    Purpose:  portal view of dbo.ContactAddresses data

    revisor     date            description
    ---------   -----------     ----------------------------
    ccarson     2013-03-05      refactored to use Core.mc_contact view


    Notes

    This view should eventually be replaced by a Core.mc_contact_addresses view

************************************************************************************************************************************
*/
AS
    SELECT  t.ContactAddressesID AS id
          , a.add_type
          , a.address1
          , a.address2
          , a.address3
          , a.city
          , a.state
          , a.zip
          , a.country
          , tc.id AS user_id
          , a.defaultaddress
          , a.name
          , a.createdDate
      FROM  dbo.ContactAddresses AS a
INNER JOIN  dbo.vw_transitionContactAddresses AS t ON a.id = t.id
            AND t.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems WHERE systemName = 'mcFoodShield' )
INNER JOIN  Core.mc_contact AS tc ON a.ContactsID = tc.contactID AND tc.portalName = 'mcFoodShield' ;