CREATE TABLE [dbo].[mc_access_request] (
    [id]         INT           IDENTITY (25, 1) NOT NULL,
    [user_id]    INT           NOT NULL,
    [group_id]   INT           NOT NULL,
    [dRequested] DATETIME2 (0) NOT NULL,
    [referrer]   VARCHAR (100) NOT NULL
);

