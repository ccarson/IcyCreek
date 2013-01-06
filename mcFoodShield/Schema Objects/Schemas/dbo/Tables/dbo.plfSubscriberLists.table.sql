CREATE TABLE [dbo].[plfSubscriberLists] (
    [subscriberListId]                         INT            IDENTITY (1, 1) NOT NULL,
    [clientId]                                 INT            NULL,
    [subscriberListName]                       NVARCHAR (255) NULL,
    [subscriberListDescription]                NVARCHAR (MAX) NULL,
    [subscriberListDateCreated]                DATETIME       NULL,
    [subscriberListUID]                        NVARCHAR (255) NULL,
    [subscriberListType]                       NVARCHAR (20)  NULL,
    [subscriberListConfirmationUrl]            NVARCHAR (255) NULL,
    [subscriberListSendEmail]                  NVARCHAR (10)  NULL,
    [subscriberListEmailFromName]              NVARCHAR (100) NULL,
    [subscriberListEmailFromEmail]             NVARCHAR (100) NULL,
    [subscriberListEmailSubject]               NVARCHAR (100) NULL,
    [subscriberListEmailContent]               NVARCHAR (MAX) NULL,
    [subscriberListOtherListIdList]            NVARCHAR (255) NULL,
    [subscriberListUnsubscribeType]            NVARCHAR (20)  NULL,
    [subscriberListUnsubscribeConfirmationURL] NVARCHAR (255) NULL,
    CHECK ([subscriberListType]='TABLE' OR [subscriberListType]='CSS' OR [subscriberListType]='BASIC'),
    CHECK ([subscriberListSendEmail]='YES' OR [subscriberListSendEmail]='NO'),
    CHECK ([subscriberListUnsubscribeType]='REMOVE' OR [subscriberListUnsubscribeType]='SUPPRESS')
);

