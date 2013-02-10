CREATE TABLE [dbo].[mc_contact_grouproles] (
    [id]               INT           IDENTITY (5277, 1) NOT NULL,
    [group_id]         INT           NOT NULL,
    [user_id]          INT           NOT NULL,
    [standard_role_id] INT           NOT NULL,
    [custom_role_id]   INT           NOT NULL,
    [added_by]         INT           NOT NULL,
    [added_date]       DATETIME2 (0) NULL
);

