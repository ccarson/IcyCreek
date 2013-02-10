CREATE TABLE [dbo].[savvy_security] (
    [id]         INT           IDENTITY (8, 1) NOT NULL,
    [sPage_Name] NVARCHAR (50) NOT NULL,
    [iGroup_id]  INT           NOT NULL,
    [bMember]    BIT           NOT NULL,
    [bAdmin]     BIT           NOT NULL,
    [iCreatedBy] INT           NOT NULL,
    [dCreatedOn] DATETIME2 (0) NULL
);

