CREATE TABLE [dbo].[learn_usersdeclined] (
    [id]             INT            IDENTITY (1, 1) NOT NULL,
    [courseID]       NCHAR (35)     NOT NULL,
    [userID]         INT            NOT NULL,
    [reasonDeclined] NVARCHAR (MAX) NULL,
    [declinedDate]   DATETIME2 (0)  NULL,
    [declinedBy]     INT            NOT NULL
);

