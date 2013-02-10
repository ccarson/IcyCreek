CREATE TABLE [dbo].[s_users] (
    [user_id]       NVARCHAR (50) NOT NULL,
    [survey_id]     NVARCHAR (50) NOT NULL,
    [dateCompleted] DATETIME2 (0) NOT NULL,
    [id]            NVARCHAR (35) NOT NULL,
    [isAdmin]       BIT           NOT NULL,
    [username]      NVARCHAR (50) NULL
);

