CREATE TABLE [dbo].[pt_groups] (
    [id]        INT           IDENTITY (1, 1) NOT NULL,
    [group_id]  INT           NOT NULL,
    [projectid] NVARCHAR (36) NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);

