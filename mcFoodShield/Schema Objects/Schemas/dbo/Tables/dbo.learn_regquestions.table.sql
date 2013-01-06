CREATE TABLE [dbo].[learn_regquestions] (
    [questionID]           NVARCHAR (35)  NOT NULL,
    [question]             NVARCHAR (250) NOT NULL,
    [createdOn]            DATETIME2 (0)  NOT NULL,
    [createdBy]            NVARCHAR (35)  NOT NULL,
    [updatedOn]            DATETIME       NOT NULL,
    [updatedBy]            NVARCHAR (35)  NULL,
    [questionTypeID]       BIGINT         NOT NULL,
    [courseID]             NVARCHAR (35)  NOT NULL,
    [questionDisplayOrder] BIGINT         NOT NULL
);

