CREATE TABLE [dbo].[security_assets] (
    [group_id]      INT            NOT NULL,
    [id]            INT            IDENTITY (27, 1) NOT NULL,
    [asset_name]    NVARCHAR (50)  NOT NULL,
    [asset_display] NVARCHAR (50)  NOT NULL,
    [description]   NVARCHAR (200) NULL,
    [dateCreated]   DATETIME2 (0)  NOT NULL,
    [dateEdited]    DATETIME2 (0)  NOT NULL,
    [AdminCreated]  INT            NOT NULL,
    [active]        BIT            NOT NULL
);

