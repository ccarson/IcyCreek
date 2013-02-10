CREATE TABLE [dbo].[mc_reactivate] (
    [id]             INT           IDENTITY (371, 1) NOT NULL,
    [act_id]         NVARCHAR (64) NOT NULL,
    [user_id]        INT           NOT NULL,
    [requestedOn]    DATETIME2 (0) NOT NULL,
    [expiresOn]      DATETIME2 (0) NULL,
    [password_reset] BIT           NULL
);

