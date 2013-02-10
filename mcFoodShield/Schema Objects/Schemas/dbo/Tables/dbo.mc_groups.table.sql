﻿CREATE TABLE [dbo].[mc_groups] (
    [Group_ID]          INT              IDENTITY (956, 1) NOT NULL,
    [Group_Name]        NVARCHAR (255)   NOT NULL,
    [parent_group_id]   INT              NOT NULL,
    [Status]            NVARCHAR (50)    NULL,
    [Description]       NVARCHAR (MAX)   NULL,
    [link]              NVARCHAR (75)    NULL,
    [forum]             NVARCHAR (50)    NULL,
    [calendar]          INT              NULL,
    [doclibrary]        INT              NULL,
    [password]          NVARCHAR (20)    NULL,
    [private]           BIT              NULL,
    [type_id]           INT              NULL,
    [createdBy]         INT              NULL,
    [createdOn]         DATETIME2 (0)    NULL,
    [owner]             INT              NULL,
    [active]            BIT              NULL,
    [openclose]         BIT              NULL,
    [connectID]         INT              NULL,
    [surveys]           BIT              NOT NULL,
    [wiki]              INT              NOT NULL,
    [polls]             BIT              NOT NULL,
    [newsletters]       INT              NOT NULL,
    [homepage]          INT              NOT NULL,
    [photos]            BIT              NOT NULL,
    [terms]             BIT              NOT NULL,
    [notes]             NVARCHAR (MAX)   NULL,
    [allowemails]       BIT              NOT NULL,
    [swelcomemessage]   NVARCHAR (MAX)   NULL,
    [allowcustom]       BIT              NOT NULL,
    [allownotes]        BIT              NOT NULL,
    [allowcustommember] BIT              NOT NULL,
    [sMemberMessage]    NVARCHAR (MAX)   NULL,
    [group_shortname]   NVARCHAR (255)   NULL,
    [homepagecontent]   NVARCHAR (MAX)   NULL,
    [sPopPage]          BIT              NOT NULL,
    [bAllowPending]     BIT              NOT NULL,
    [isystem_id]        INT              NOT NULL,
    [kb_id]             INT              NOT NULL,
    [link_id]           INT              NOT NULL,
    [daccess_start]     DATETIME2 (0)    NULL,
    [daccess_end]       DATETIME2 (0)    NULL,
    [twitter_id]        NVARCHAR (50)    NULL,
    [rss]               BIT              NOT NULL,
    [video]             BIT              NOT NULL,
    [logo]              NVARCHAR (200)   NULL,
    [sponsor_name]      NVARCHAR (200)   NULL,
    [merged_group_id]   INT              NOT NULL,
    [ssubjectprefix]    NVARCHAR (50)    NULL,
    [publichomepage]    INT              NOT NULL,
    [internalnews]      BIT              NOT NULL,
    [stwitteruser]      NVARCHAR (50)    NULL,
    [stwitterpass]      NVARCHAR (50)    NULL,
    [bdisableaccess]    BIT              NOT NULL,
    [bfromgroupname]    BIT              NOT NULL,
    [blogoinemail]      BIT              NULL,
    [formXReportsID]    UNIQUEIDENTIFIER NULL,
    [useProjectTracker] BIT              NULL,
    [brandingEnabled]   BIT              NOT NULL,
    [SendWelcomeEmail]  BIT              NOT NULL,
    [WelcomeEmailSent]  DATETIME2 (7)    NULL,
    [sort]              INT              DEFAULT ((0)) NOT NULL,
    [IsDemo]            BIT              NOT NULL
);

