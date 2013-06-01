CREATE TABLE [dbo].[vfc_file] (
    [ID]                 INT              IDENTITY (725, 1) NOT NULL,
    [MIMETypeID]         INT              CONSTRAINT [DF_vfc_file_MIMETypeID] DEFAULT ('0') NOT NULL,
    [ParentFolderID]     INT              CONSTRAINT [DF_vfc_file_ParentFolderID] DEFAULT ('0') NOT NULL,
    [iByteSize]          INT              CONSTRAINT [DF_vfc_file_iByteSize] DEFAULT ('0') NOT NULL,
    [sName]              NVARCHAR (MAX)   NULL,
    [serverFileName]     NVARCHAR (3000)  CONSTRAINT [DF_vfc_file_serverFileName] DEFAULT (N'') NULL,
    [sAuthor]            NVARCHAR (200)   CONSTRAINT [DF_vfc_file_sAuthor] DEFAULT (NULL) NULL,
    [sSource]            NVARCHAR (200)   CONSTRAINT [DF_vfc_file_sSource] DEFAULT (NULL) NULL,
    [iRevision]          INT              CONSTRAINT [DF_vfc_file_iRevision] DEFAULT ('0') NOT NULL,
    [sTitle]             NVARCHAR (255)   CONSTRAINT [DF_vfc_file_sTitle] DEFAULT (NULL) NULL,
    [sSubject]           NVARCHAR (100)   CONSTRAINT [DF_vfc_file_sSubject] DEFAULT (NULL) NULL,
    [sLocation]          NVARCHAR (MAX)   NULL,
    [bDeleted]           BIT              CONSTRAINT [DF_vfc_file_bDeleted] DEFAULT ((0)) NOT NULL,
    [dtCreated]          DATETIME2 (0)    NOT NULL,
    [CreatedByUserID]    INT              CONSTRAINT [DF_vfc_file_CreatedByUserID] DEFAULT ('0') NOT NULL,
    [dtUpdated]          DATETIME2 (0)    NOT NULL,
    [UpdatedByUserID]    INT              CONSTRAINT [DF_vfc_file_UpdatedByUserID] DEFAULT ('0') NULL,
    [dtCheckedOut]       DATETIME2 (0)    CONSTRAINT [DF_vfc_file_dtCheckedOut] DEFAULT (NULL) NULL,
    [CheckedOutByUserID] INT              CONSTRAINT [DF_vfc_file_CheckedOutByUserID] DEFAULT ('0') NULL,
    [sComments]          NVARCHAR (MAX)   NULL,
    [sDescription]       NVARCHAR (MAX)   NULL,
    [sContentType]       NVARCHAR (160)   CONSTRAINT [DF_vfc_file_sContentType] DEFAULT (N'application/octet-stream') NOT NULL,
    [bActive]            BIT              CONSTRAINT [DF_vfc_file_bActive] DEFAULT ((0)) NOT NULL,
    [status]             INT              CONSTRAINT [DF_vfc_file_status] DEFAULT ('0') NOT NULL,
    [threadID]           NVARCHAR (50)    CONSTRAINT [DF_vfc_file_threadID] DEFAULT (N'0') NULL,
    [pLocation]          NVARCHAR (MAX)   NULL,
    [sCheckOutComments]  NVARCHAR (255)   CONSTRAINT [DF_vfc_file_sCheckOutComments] DEFAULT (NULL) NULL,
    [bLog]               BIT              CONSTRAINT [DF_vfc_file_bLog] DEFAULT ((0)) NOT NULL,
    [iSendLog]           INT              CONSTRAINT [DF_vfc_file_iSendLog] DEFAULT ('1') NOT NULL,
    [iViews]             INT              CONSTRAINT [DF_vfc_file_iViews] DEFAULT ('0') NOT NULL,
    [bShare]             BIT              CONSTRAINT [DF_vfc_file_bShare] DEFAULT ((1)) NOT NULL,
    [bUseAuthor]         BIT              CONSTRAINT [DF_vfc_file_bUseAuthor] DEFAULT ((0)) NOT NULL,
    [showGroup]          BIT              CONSTRAINT [DF_vfc_file_showGroup] DEFAULT ((0)) NOT NULL,
    [sharegroup]         BIT              CONSTRAINT [DF_vfc_file_sharegroup] DEFAULT ((0)) NOT NULL,
    [iDownloads]         INT              CONSTRAINT [DF_vfc_file_iDownloads] DEFAULT ('0') NOT NULL,
    [dtExpires]          DATETIME2 (0)    CONSTRAINT [DF_vfc_file_dtExpires] DEFAULT (NULL) NULL,
    [isortOrder]         INT              CONSTRAINT [DF_vfc_file_isortOrder] DEFAULT ('0') NOT NULL,
    [iMinorRevision]     INT              CONSTRAINT [DF_vfc_file_iMinorRevision] DEFAULT ('0') NOT NULL,
    [allowComments]      BIT              CONSTRAINT [DF_vfc_file_allowComments] DEFAULT ((0)) NULL,
    [thumbs]             BIT              CONSTRAINT [DF_vfc_file_thumbs] DEFAULT ((0)) NOT NULL,
    [thumblocation]      NVARCHAR (MAX)   CONSTRAINT [DF_vfc_file_thumblocation] DEFAULT ('') NOT NULL,
    [iComments]          INT              CONSTRAINT [DF_vfc_file_iComments] DEFAULT ('0') NOT NULL,
    [iPriority]          INT              CONSTRAINT [DF_vfc_file_iPriority] DEFAULT ('1') NOT NULL,
    [bPublic]            BIT              CONSTRAINT [DF_vfc_file_bPublic] DEFAULT ((0)) NOT NULL,
    [placeholder]        NVARCHAR (255)   CONSTRAINT [DF_vfc_file_placeholder] DEFAULT (NULL) NULL,
    [bsecureview]        BIT              CONSTRAINT [DF_vfc_file_bsecureview] DEFAULT ((0)) NOT NULL,
    [bencrypted]         BIT              CONSTRAINT [DF_vfc_file_bencrypted] DEFAULT ((0)) NOT NULL,
    [uid]                UNIQUEIDENTIFIER CONSTRAINT [DF_vfc_file_fileUUID] DEFAULT (newsequentialid()) NOT NULL,
    [swflocation]        NVARCHAR (500)   NULL,
    [customVersionNum]   NVARCHAR (20)    NULL,
    [tempSLocation]      NVARCHAR (MAX)   NULL,
    [tempPLocation]      NVARCHAR (MAX)   NULL,
    [uploaded]           BIT              CONSTRAINT [DF_vfc_file_uploaded] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_vfc_file_ID] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90)
);




GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_vfc_file_uuid]
    ON [dbo].[vfc_file]([uid] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_vfc_file_ParentFolder]
    ON [dbo].[vfc_file]([ParentFolderID] ASC, [ID] ASC)
    INCLUDE([sName], [dtCreated], [bActive]);

