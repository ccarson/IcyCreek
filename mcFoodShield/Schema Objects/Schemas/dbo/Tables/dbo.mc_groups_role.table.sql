CREATE TABLE [dbo].[mc_groups_role] (
    [id]         INT           IDENTITY (35, 1) NOT NULL,
    [role_name]  VARCHAR (255) NOT NULL,
    [is_active]  BIT           NULL,
    [sort_order] INT           NOT NULL,
    [bAdmin]     BIT           NOT NULL,
    [bMembers]   BIT           NOT NULL,
    [bRManager]  BIT           NOT NULL,
    [igroup_id]  INT           NOT NULL
);

