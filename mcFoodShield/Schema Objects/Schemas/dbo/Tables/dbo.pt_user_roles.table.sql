CREATE TABLE [dbo].[pt_user_roles] (
    [id]        INT              IDENTITY (1, 1) NOT NULL,
    [userID]    UNIQUEIDENTIFIER NOT NULL,
    [admin]     BIT              NOT NULL,
    [report]    BIT              NOT NULL,
    [invoice]   BIT              NOT NULL,
    [active]    BIT              NOT NULL,
    [projectID] NVARCHAR (35)    NOT NULL
);

