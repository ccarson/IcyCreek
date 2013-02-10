CREATE TABLE [dbo].[pt_timetrack] (
    [timetrackID] NCHAR (35)     NOT NULL,
    [projectID]   NCHAR (35)     NOT NULL,
    [userID]      NCHAR (35)     NOT NULL,
    [dateStamp]   DATETIME2 (0)  NULL,
    [hours]       DECIMAL (6, 2) NULL,
    [description] NVARCHAR (255) NULL,
    [itemID]      NVARCHAR (35)  NULL,
    [itemType]    NVARCHAR (10)  NULL,
    [rateID]      NVARCHAR (35)  NULL,
    [billed]      INT            NULL,
    [paid]        INT            NULL
);

