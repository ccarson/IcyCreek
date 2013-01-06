CREATE TABLE [dbo].[fs_contact_tierhead] (
    [id]            INT           IDENTITY (113, 1) NOT NULL,
    [user_id]       INT           NOT NULL,
    [org_id]        INT           NOT NULL,
    [dept_id]       INT           NOT NULL,
    [date_added]    DATETIME2 (0) NULL,
    [added_by]      INT           NOT NULL,
    [date_modified] DATETIME2 (0) NULL,
    [modified_by]   INT           NOT NULL
);

