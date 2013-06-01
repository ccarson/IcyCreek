CREATE TABLE [dbo].[methods] (
    [id]               INT            IDENTITY (1, 1) NOT NULL,
    [methodTypeID]     INT            NOT NULL,
    [name]             NVARCHAR (200) NOT NULL,
    [information]      NVARCHAR (500) NOT NULL,
    [contact]          NVARCHAR (100) NOT NULL,
    [orderInformation] NVARCHAR (100) NOT NULL,
    [isActive]         BIT            NOT NULL,
    [vfc_fileID]       INT            NOT NULL,
    [incPluginComment] BIT            NOT NULL
);

