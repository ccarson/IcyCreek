CREATE TABLE [dbo].[vfc_filehistory] (
    [ID]                 INT            IDENTITY (668, 1) NOT NULL,
    [FileID]             INT            CONSTRAINT [DF_vfc_filehistory_FileID] DEFAULT ('0') NOT NULL,
    [MIMETypeID]         INT            CONSTRAINT [DF_vfc_filehistory_MIMETypeID] DEFAULT ('0') NOT NULL,
    [iByteSize]          INT            CONSTRAINT [DF_vfc_filehistory_iByteSize] DEFAULT ('0') NOT NULL,
    [sName]              NVARCHAR (MAX) NOT NULL,
    [sAuthor]            NVARCHAR (MAX) NULL,
    [sSource]            NVARCHAR (MAX) NULL,
    [sRevision]          INT            CONSTRAINT [DF_vfc_filehistory_sRevision] DEFAULT ('0') NOT NULL,
    [sTitle]             NVARCHAR (MAX) NULL,
    [sSubject]           NVARCHAR (MAX) NULL,
    [dtAdded]            DATETIME2 (0)  NOT NULL,
    [AddedByUserID]      INT            CONSTRAINT [DF_vfc_filehistory_AddedByUserID] DEFAULT ('0') NOT NULL,
    [dtCheckedOut]       DATETIME2 (0)  CONSTRAINT [DF_vfc_filehistory_dtCheckedOut] DEFAULT (NULL) NULL,
    [CheckedOutByUserID] INT            CONSTRAINT [DF_vfc_filehistory_CheckedOutByUserID] DEFAULT ('0') NULL,
    [dtCheckedIn]        DATETIME2 (0)  CONSTRAINT [DF_vfc_filehistory_dtCheckedIn] DEFAULT (NULL) NULL,
    [CheckedInByUserID]  INT            CONSTRAINT [DF_vfc_filehistory_CheckedInByUserID] DEFAULT ('0') NULL,
    [sHistoryComments]   NVARCHAR (MAX) NULL,
    [sFileComments]      NVARCHAR (MAX) NULL,
    [sDescription]       NVARCHAR (MAX) NULL,
    [location]           NVARCHAR (MAX) NULL,
    [pChange]            FLOAT (53)     CONSTRAINT [DF_vfc_filehistory_pChange] DEFAULT ('0') NULL,
    [plocation]          NVARCHAR (MAX) NULL,
    [iMinorRevision]     INT            CONSTRAINT [DF_vfc_filehistory_iMinorRevision] DEFAULT ('0') NOT NULL,
    [swflocation]        NVARCHAR (200) NULL,
    [uploaded]           BIT            CONSTRAINT [DF_vfc_filehistory_uploaded] DEFAULT ((0)) NOT NULL,
    [tempLocation]       NVARCHAR (MAX) NULL,
    [tempPLocation]      NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_vfc_filehistory_ID] PRIMARY KEY CLUSTERED ([ID] ASC)
);



