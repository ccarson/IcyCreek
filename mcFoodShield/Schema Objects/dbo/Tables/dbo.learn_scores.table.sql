CREATE TABLE [dbo].[learn_scores] (
    [scoreID]            NVARCHAR (35) NOT NULL,
    [examID]             NVARCHAR (35) NOT NULL,
    [userID]             NVARCHAR (35) NOT NULL,
    [numQuestions]       BIGINT        NOT NULL,
    [numAnswered]        BIGINT        NOT NULL,
    [numAnsweredCorrect] BIGINT        NOT NULL,
    [examFinishedOn]     DATETIME2 (0) NULL
);

