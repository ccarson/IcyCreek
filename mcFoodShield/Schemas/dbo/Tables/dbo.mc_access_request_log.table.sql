CREATE TABLE [dbo].[mc_access_request_log] (
    [id]          INT           IDENTITY (24, 1) NOT NULL,
    [user_id]     INT           NOT NULL,
    [group_id]    INT           NOT NULL,
    [dAction]     DATETIME2 (0) NULL,
    [iStatus]     INT           NOT NULL,
    [approve_id]  INT           NOT NULL,
    [member_type] INT           NOT NULL
);

