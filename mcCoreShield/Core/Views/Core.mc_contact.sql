
CREATE VIEW [Core].[mc_contact]
WITH SCHEMABINDING
/*
************************************************************************************************************************************

       View:  Core.mc_contact
     Author:  ccarson
    Purpose:  shows Core version of mc_contact view, showing all portal data in a single view


    revisor         date                description
    ---------       -----------         ----------------------------
    ccarson         ###DATE###          created

    Notes:
    This is the "all portals" equivalent of the portal view of the same name.
    The coreShield version of the view contains system fields and coreShieldIDs for the portal ID fieldd

************************************************************************************************************************************
*/
AS
    SELECT  id                  = cts.mc_contactID
          , Salutation          = cnt.salutation
          , JobTitle            = cnt.jobTitle
          , Firstname           = cnt.firstName
          , Initial             = cnt.middleInitial
          , Lastname            = cnt.lastName
          , Suffix              = cnt.suffix
          , Email               = cnt.email
          , Login               = cnt.userLogin
          , Password            = cnt.userPassword
          , salt                = cnt.salt
          , AccessID            = cts.accessID
          , Expires             = cts.expiresOn
          , Hits                = cts.numberOfHits
          , LastLogin           = cts.lastLoginOn
          , Status              = cts.status
          , ModifiedBy          = COALESCE ( ctu.mc_contactID, 0 )
          , DateModified        = cts.updatedOn
          , datejoined          = cts.joinedOn
          , membertype          = cts.memberType
          , photo               = cnt.photo
          , resume              = cnt.resume
          , thumb               = cnt.thumb
          , PIN                 = cnt.PIN
          , reset               = cnt.reset
          , mailsent            = cnt.mailsent
          , sysmember           = cts.sysmember
          , maildate            = cnt.maildate
          , updatesent          = cnt.updatesent
          , updatenum           = cnt.updatenum
          , nosend              = cnt.nosend
          , hidden              = cts.isHidden
          , security_level      = cts.securityLevel
          , review              = cnt.review
          , Q1                  = cnt.Q1
          , Q2                  = cnt.Q2
          , Q3                  = cnt.Q3
          , iAnswer             = cnt.iAnswer
          , ipMac               = cnt.ipMac
          , frequency_id        = cnt.frequencyID
          , refer               = cnt.refer
          , is_active           = cnt.isActive
          , TimeZone            = cnt.timezone
          , usesDaylight        = cnt.usesDaylight
          , TzOffset            = cnt.tzOffset
          , iDefault_Quota      = cnt.iDefaultQuota
          , iDoc_Usage          = cnt.iDocUsage
          , assist_id           = cnt.assistID
          , layout              = cnt.layout
          , bTOS                = cnt.bTOS
          , bOnlineNow          = cnt.bOnlineNow
          , uID                 = cnt.uID
          , iwkgrplayout        = cnt.workgroupLayout
          , sAboutMe            = cnt.aboutMe
          , folder_id           = cts.folderID
          , signature           = cnt.signature
          , dateAdded           = cts.createdOn
          , addedBy             = COALESCE( ctc.mc_contactID, 0 )
          , bAuditLock          = cnt.bAuditLock
          , bProfileUpdate      = cnt.bProfileUpdate
          , bExpireReminder     = cnt.bExpireReminder
          , bPingSent           = cnt.bPingSent
          , dPingDate           = cnt.dPingDate
          , bVerified           = cnt.bVerified
          , iVerifiedBy         = COALESCE( ctv.mc_contactID, 0 )
          , dVerifiedDate       = cnt.verifiedOn
          , inetwork            = cnt.iNetwork
          , isSuspect           = cnt.isSuspect
          , portalName          = sys.systemName
		  , userSystemName		= sys.userSystemName
          , systemID            = sys.ID
          , contactID           = cnt.ID
          , createdID           = ctc.ID
          , updatedID           = ctu.ID
          , verifiedID          = ctv.ID
      FROM  dbo.Contacts       AS cnt
INNER JOIN  dbo.ContactSystems AS cts ON cts.ID = cnt.ID
INNER JOIN  Reference.Systems  AS sys ON sys.ID = cts.systemID
 LEFT JOIN  dbo.ContactSystems AS ctc ON ctc.ID = cts.createdBy  AND ctc.systemID = sys.ID
 LEFT JOIN  dbo.ContactSystems AS ctu ON ctu.ID = cts.updatedBy  AND ctu.systemID = sys.ID
 LEFT JOIN  dbo.ContactSystems AS ctv ON ctv.ID = cnt.verifiedBy AND ctv.systemID = sys.ID ;