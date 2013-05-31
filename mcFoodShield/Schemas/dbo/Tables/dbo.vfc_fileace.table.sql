CREATE TABLE [dbo].[vfc_fileace] (
    [FileID]           INT CONSTRAINT [DF_vfc_fileace_FileID] DEFAULT ('0') NOT NULL,
    [UserGroupID]      INT CONSTRAINT [DF_vfc_fileace_UserGroupID] DEFAULT ('0') NULL,
    [UserGroupTypeID]  INT CONSTRAINT [DF_vfc_fileace_UserGroupTypeID] DEFAULT ('0') NULL,
    [bAdmin]           BIT CONSTRAINT [DF_vfc_fileace_bAdmin] DEFAULT ((0)) NULL,
    [privateFile]      BIT CONSTRAINT [DF_vfc_fileace_privateFile] DEFAULT ((0)) NOT NULL,
    [igrouproleid]     INT CONSTRAINT [DF_vfc_fileace_igrouproleid] DEFAULT ('0') NOT NULL,
    [icustomprofileid] INT CONSTRAINT [DF_vfc_fileace_icustomprofileid] DEFAULT ('0') NOT NULL,
    [iminigroupid]     INT CONSTRAINT [DF_vfc_fileace_iminigroupid] DEFAULT ('0') NOT NULL,
    [iuserid]          INT CONSTRAINT [DF_vfc_fileace_iuserid] DEFAULT ('0') NOT NULL,
    [id]               INT IDENTITY (930, 1) NOT NULL,
    CONSTRAINT [PK_vfc_fileace_id] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 90)
);



