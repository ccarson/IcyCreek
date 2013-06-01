CREATE TABLE [dbo].[learn_reganswers] (
    [answerID]   NVARCHAR (35)  NOT NULL,
    [questionID] NVARCHAR (35)  NOT NULL,
    [courseID]   NVARCHAR (35)  NOT NULL,
    [answer]     NVARCHAR (250) NOT NULL,
    [createdBy]  NVARCHAR (35)  NOT NULL,
    [createdOn]  DATETIME2 (0)  NOT NULL,
    [updatedBy]  NVARCHAR (35)  NULL,
    [updatedOn]  DATETIME2 (0)  NULL
);

