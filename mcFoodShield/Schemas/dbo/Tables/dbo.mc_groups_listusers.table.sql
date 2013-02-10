CREATE TABLE [dbo].[mc_groups_listusers] (
    [id]        INT IDENTITY (226, 1) NOT NULL,
    [igroup_id] INT NOT NULL,
    [iuser_id]  INT NOT NULL,
    [ilist_id]  INT NOT NULL,
    [bactive]   BIT NULL
);

