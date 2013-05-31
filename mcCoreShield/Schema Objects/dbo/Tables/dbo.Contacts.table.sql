CREATE TABLE [dbo].[Contacts] (
    [ID]              UNIQUEIDENTIFIER NOT NULL,
    [salutation]      NVARCHAR (20)    NULL,
    [jobTitle]        NVARCHAR (255)   NULL,
    [firstName]       NVARCHAR (50)    NULL,
    [middleInitial]   NVARCHAR (50)    NULL,
    [lastName]        NVARCHAR (50)    NULL,
    [suffix]          NVARCHAR (40)    NULL,
    [email]           NVARCHAR (50)    NULL,
    [userLogin]       NVARCHAR (50)    NULL,
    [userPassword]    NVARCHAR (500)   NULL,
    [salt]            NVARCHAR (35)    NULL,
    [accessID]        INT              NULL,
    [photo]           NVARCHAR (120)   NULL,
    [resume]          NVARCHAR (120)   NULL,
    [thumb]           NVARCHAR (120)   NULL,
    [PIN]             INT              NULL,
    [reset]           BIT              NULL,
    [mailsent]        BIT              NULL,
    [maildate]        DATETIME2 (7)    NULL,
    [updatesent]      DATETIME2 (7)    NULL,
    [updatenum]       INT              NULL,
    [nosend]          BIT              NULL,
    [review]          BIT              NULL,
    [Q1]              NVARCHAR (50)    NULL,
    [Q2]              NVARCHAR (50)    NULL,
    [Q3]              NVARCHAR (50)    NULL,
    [iAnswer]         NVARCHAR (50)    NULL,
    [ipMac]           NVARCHAR (100)   NULL,
    [frequencyID]     INT              NULL,
    [refer]           INT              NULL,
    [isActive]        BIT              NULL,
    [timeZone]        NVARCHAR (35)    NULL,
    [usesDaylight]    BIT              NULL,
    [tzOffset]        INT              NULL,
    [iDefaultQuota]   INT              NULL,
    [iDocUsage]       DECIMAL (10)     CONSTRAINT [DF_Contacts_iDoc_Usage] DEFAULT ((0)) NULL,
    [assistID]        INT              NULL,
    [layout]          INT              NULL,
    [bTOS]            BIT              NULL,
    [bOnlineNow]      BIT              NULL,
    [uID]             UNIQUEIDENTIFIER NULL,
    [workgroupLayout] INT              NULL,
    [aboutMe]         NVARCHAR (500)   NULL,
    [signature]       NVARCHAR (MAX)   NULL,
    [bAuditLock]      BIT              NULL,
    [bProfileUpdate]  BIT              NULL,
    [bExpireReminder] BIT              NULL,
    [bPingSent]       BIT              NULL,
    [dPingDate]       DATETIME2 (7)    NULL,
    [bVerified]       BIT              NULL,
    [verifiedBy]      UNIQUEIDENTIFIER NULL,
    [verifiedOn]      DATETIME2 (7)    NULL,
    [inetwork]        INT              NULL,
    [isSuspect]       BIT              CONSTRAINT [DF_Contacts_isSuspect] DEFAULT ((0)) NOT NULL,
    [createdOn]       DATETIME2 (7)    NULL,
    [createdBy]       UNIQUEIDENTIFIER NULL,
    [updatedOn]       DATETIME2 (7)    NULL,
    [updatedBy]       UNIQUEIDENTIFIER NULL,
    CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED ([ID] ASC)
);






GO
CREATE NONCLUSTERED INDEX [ixContacts_lastName_firstName]
    ON [dbo].[Contacts]([lastName] ASC, [firstName] ASC)
    INCLUDE([ID]);

