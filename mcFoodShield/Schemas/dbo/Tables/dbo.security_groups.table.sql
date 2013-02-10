CREATE TABLE [dbo].[security_groups] (
    [id]          INT           IDENTITY (4, 1) NOT NULL,
    [group_name]  NVARCHAR (50) NOT NULL,
    [description] NVARCHAR (50) NULL,
    [active]      BIT           NOT NULL
);

