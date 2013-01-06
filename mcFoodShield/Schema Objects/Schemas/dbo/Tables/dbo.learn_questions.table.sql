CREATE TABLE [dbo].[learn_questions] (
    [questionID]           NVARCHAR (35)  NOT NULL,
    [question]             NVARCHAR (250) NOT NULL,
    [hint]                 NVARCHAR (250) NULL,
    [createdOn]            DATETIME2 (0)  NOT NULL,
    [createdBy]            NVARCHAR (35)  NOT NULL,
    [updatedOn]            DATETIME       NOT NULL,
    [updatedBy]            NVARCHAR (35)  NULL,
    [questionTypeID]       BIGINT         NOT NULL,
    [examID]               NVARCHAR (35)  NOT NULL,
    [questionDisplayOrder] BIGINT         NOT NULL
);

