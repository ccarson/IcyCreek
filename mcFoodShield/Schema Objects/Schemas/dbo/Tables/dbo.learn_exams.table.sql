CREATE TABLE [dbo].[learn_exams] (
    [examID]    NVARCHAR (35) NOT NULL,
    [examName]  NVARCHAR (50) NOT NULL,
    [createdOn] DATETIME2 (0) NULL,
    [createdBy] NVARCHAR (35) NOT NULL,
    [updatedOn] DATETIME      NOT NULL,
    [updatedBy] NVARCHAR (35) NULL,
    [courseID]  NVARCHAR (35) NOT NULL,
    [startDate] DATETIME2 (0) NULL,
    [dueDate]   DATETIME2 (0) NULL,
    [issueDate] DATETIME2 (0) NULL
);

