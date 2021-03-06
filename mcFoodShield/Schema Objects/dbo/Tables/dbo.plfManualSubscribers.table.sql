﻿CREATE TABLE [dbo].[plfManualSubscribers] (
    [subscriberId]               INT            IDENTITY (1, 1) NOT NULL,
    [clientId]                   INT            NULL,
    [campaignId]                 INT            NULL,
    [subscriberName]             NVARCHAR (150) NULL,
    [subscriberFirstName]        NVARCHAR (100) NULL,
    [subscriberLastName]         NVARCHAR (100) NULL,
    [subscriberEmailAddress]     NVARCHAR (150) NOT NULL,
    [subscriberDateAdded]        DATETIME       NULL,
    [subscriberMethodSubscribed] NVARCHAR (50)  NULL,
    [subscriberUnsubscribed]     NVARCHAR (50)  NULL,
    [subscriberDateUnsubscribed] DATETIME       NULL,
    [subscriberCustomField1]     NVARCHAR (255) NULL,
    [subscriberCustomField2]     NVARCHAR (255) NULL,
    [subscriberCustomField3]     NVARCHAR (255) NULL,
    [subscriberCustomField4]     NVARCHAR (255) NULL,
    [subscriberCustomField5]     NVARCHAR (255) NULL,
    [subscriberUID]              NVARCHAR (255) NULL,
    [subscriberBounced]          NVARCHAR (50)  NULL,
    [subscriberBounceCount]      INT            NULL,
    [subscriberDeleted]          NVARCHAR (50)  NULL,
    [subscriberValidated]        NVARCHAR (50)  NULL,
    CHECK ([subscriberMethodSubscribed]='SUBSCRIBED' OR [subscriberMethodSubscribed]='IMPORTED'),
    CHECK ([subscriberUnsubscribed]='YES' OR [subscriberUnsubscribed]='NO'),
    CHECK ([subscriberBounced]='YES' OR [subscriberBounced]='NO'),
    CHECK ([subscriberDeleted]='YES' OR [subscriberDeleted]='NO'),
    CHECK ([subscriberValidated]='YES' OR [subscriberValidated]='NO')
);

