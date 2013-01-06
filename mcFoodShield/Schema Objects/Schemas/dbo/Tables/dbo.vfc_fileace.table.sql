CREATE TABLE [dbo].[vfc_fileace] (
    [FileID]           INT NOT NULL,
    [UserGroupID]      INT NULL,
    [UserGroupTypeID]  INT NULL,
    [bAdmin]           BIT NULL,
    [privateFile]      BIT NOT NULL,
    [igrouproleid]     INT NOT NULL,
    [icustomprofileid] INT NOT NULL,
    [iminigroupid]     INT NOT NULL,
    [iuserid]          INT NOT NULL,
    [id]               INT IDENTITY (930, 1) NOT NULL
);

