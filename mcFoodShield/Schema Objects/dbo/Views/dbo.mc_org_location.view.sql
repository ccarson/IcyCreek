CREATE VIEW dbo.mc_org_location
/*
************************************************************************************************************************************

       View:  dbo.mc_org_location
     Author:  ccarson
    Purpose:  shows portal view of Core.mc_org_location view, showing data only for specified portal


    revisor         date                description
    ---------       -----------         ----------------------------
    ccarson         2013-03-05          created

    Notes:

************************************************************************************************************************************
*/
AS
    SELECT  id                  = id
          , org_id              = org_id
          , addressTypeID       = addressTypeID
          , name                = name
          , address1            = address1
          , address2            = address2
          , address3            = address3
          , city                = city
          , state               = state
          , zip                 = zip
          , d_phone             = d_phone
          , d_fax               = d_fax
          , active              = active
          , notes               = notes
          , country             = country
          , d_emergency_phone   = d_emergency_phone
          , d_24hr_phone        = d_24hr_phone
          , d_infectious_phone  = d_infectious_phone
          , bAlternate          = bAlternate
          , date_added          = date_added
          , date_updated        = date_updated
      FROM  Core.mc_org_location
     WHERE  portalName = 'mcFoodShield' ;
