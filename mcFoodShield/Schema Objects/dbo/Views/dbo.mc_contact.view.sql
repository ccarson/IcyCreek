CREATE VIEW dbo.mc_contact
/*
************************************************************************************************************************************

       View:  dbo.mc_contact
     Author:  ccarson
    Purpose:  shows Core version of mc_contact view, showing all portal data in a single view


    revisor         date                description
    ---------       -----------         ----------------------------
    ccarson         2013-03-05          created

    Notes:
    This is the "all portals" equivalent of the portal view of the same name.
    There are more columns in this view than the portal version:
        systemName ( same as portalName )
        coreIDs -- shows coreShield IDs for foreign key fields
    Showing coreShield IDs in this view allows for system-wide queries
        ( show me all locations for organization X, regardless of portal )

************************************************************************************************************************************
*/
AS
    SELECT  id                  = id
          , Salutation          = Salutation
          , JobTitle            = JobTitle
          , Firstname           = Firstname
          , Initial             = Initial
          , Lastname            = Lastname
          , Suffix              = Suffix
          , Email               = Email
          , Login               = Login
          , Password            = Password
          , salt                = salt
          , AccessID            = AccessID
          , Expires             = Expires
          , Hits                = Hits
          , LastLogin           = LastLogin
          , Status              = Status
          , ModifiedBy          = ModifiedBy
          , DateModified        = DateModified
          , datejoined          = datejoined
          , membertype          = membertype
          , photo               = photo
          , resume              = resume
          , thumb               = thumb
          , PIN                 = PIN
          , reset               = reset
          , mailsent            = mailsent
          , sysmember           = sysmember
          , maildate            = maildate
          , updatesent          = updatesent
          , updatenum           = updatenum
          , nosend              = nosend
          , hidden              = hidden
          , security_level      = security_level
          , review              = review
          , Q1                  = Q1
          , Q2                  = Q2
          , Q3                  = Q3
          , iAnswer             = iAnswer
          , ipMac               = ipMac
          , frequency_id        = frequency_id
          , refer               = refer
          , is_active           = is_active
          , TimeZone            = TimeZone
          , usesDaylight        = usesDaylight
          , TzOffset            = TzOffset
          , iDefault_Quota      = iDefault_Quota
          , iDoc_Usage          = iDoc_Usage
          , assist_id           = assist_id
          , layout              = layout
          , bTOS                = bTOS
          , bOnlineNow          = bOnlineNow
          , uID                 = uID
          , iwkgrplayout        = iwkgrplayout
          , sAboutMe            = sAboutMe
          , folder_id           = folder_id
          , signature           = signature
          , dateAdded           = dateAdded
          , addedBy             = addedBy
          , bAuditLock          = bAuditLock
          , bProfileUpdate      = bProfileUpdate
          , bexpirereminder     = bexpirereminder
          , bPingSent           = bPingSent
          , dPingDate           = dPingDate
          , bVerified           = bVerified
          , iVerifiedBy         = iVerifiedBy
          , dVerifiedDate       = dVerifiedDate
          , inetwork            = inetwork
          , isSuspect           = isSuspect
      FROM  Core.mc_contact
     WHERE  portalName = 'mcFoodShield' ;
