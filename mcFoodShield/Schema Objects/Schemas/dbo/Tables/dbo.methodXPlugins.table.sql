CREATE TABLE [dbo].[methodXPlugins] (
    [id]       INT            IDENTITY (1, 1) NOT NULL,
    [name]     NVARCHAR (50)  NOT NULL,
    [fileName] NVARCHAR (100) NOT NULL,
    [isActive] BIT            NOT NULL
);

