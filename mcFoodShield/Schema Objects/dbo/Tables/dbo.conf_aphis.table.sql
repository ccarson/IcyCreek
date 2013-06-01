CREATE TABLE [dbo].[conf_aphis] (
    [id]          INT           IDENTITY (59, 1) NOT NULL,
    [user_id]     INT           NOT NULL,
    [event_id]    INT           NOT NULL,
    [org_id]      INT           NOT NULL,
    [dept_id]     INT           NOT NULL,
    [sub_dept_id] INT           NOT NULL,
    [role]        NVARCHAR (50) NULL
);

