CREATE TABLE [dbo].[mc_groups_lists] (
    [id]                INT            IDENTITY (27, 1) NOT NULL,
    [igroup_id]         INT            NOT NULL,
    [slist_name]        NVARCHAR (100) NOT NULL,
    [slist_description] NVARCHAR (200) NULL,
    [dtcreated]         DATE           NOT NULL,
    [icreatedby]        INT            NOT NULL,
    [bactive]           BIT            NOT NULL
);

