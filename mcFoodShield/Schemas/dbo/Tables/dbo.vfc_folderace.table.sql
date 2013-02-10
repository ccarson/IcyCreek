CREATE TABLE [dbo].[vfc_folderace] (
    [FolderID]         INT           NOT NULL,
    [UserGroupID]      INT           NOT NULL,
    [UserGroupTypeID]  INT           NOT NULL,
    [bAdmin]           BIT           NOT NULL,
    [igrouproleid]     INT           NOT NULL,
    [icustgrouproleid] INT           NOT NULL,
    [icustomprofileid] INT           NOT NULL,
    [iminigroupid]     INT           NOT NULL,
    [iuserid]          INT           NOT NULL,
    [ID]               INT           IDENTITY (2157, 1) NOT NULL,
    [dtCreated]        DATETIME2 (0) NULL,
    [icreatedBy]       INT           NOT NULL,
    [inetworkid]       INT           NOT NULL
);

