CREATE TABLE [dbo].[keywords] (
    [id]         INT            IDENTITY (15, 1) NOT NULL,
    [skeyword]   NVARCHAR (50)  NOT NULL,
    [surl]       NVARCHAR (200) NOT NULL,
    [dtcreated]  DATE           NOT NULL,
    [icreatedby] INT            NOT NULL,
    [bactive]    BIT            NOT NULL,
    [iapp_id]    INT            NOT NULL,
    [igroup_id]  INT            NOT NULL
);

