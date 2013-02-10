CREATE TABLE [dbo].[learn_useranswers] (
    [userAnswerID] NVARCHAR (35)  NOT NULL,
    [questionID]   NVARCHAR (35)  NOT NULL,
    [examID]       NVARCHAR (35)  NOT NULL,
    [answerID]     NVARCHAR (35)  NULL,
    [answer]       NVARCHAR (250) NULL,
    [userID]       NVARCHAR (35)  NOT NULL,
    [answeredOn]   DATETIME2 (0)  NOT NULL
);

