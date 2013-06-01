CREATE TABLE [dbo].[mc_contact_activity] (
    [id]          INT            IDENTITY (324, 1) NOT NULL,
    [activity_id] INT            NOT NULL,
    [user_id]     INT            NOT NULL,
    [dateCreated] DATETIME2 (0)  NOT NULL,
    [notes]       NVARCHAR (MAX) NULL,
    [group_id]    INT            NOT NULL
);

