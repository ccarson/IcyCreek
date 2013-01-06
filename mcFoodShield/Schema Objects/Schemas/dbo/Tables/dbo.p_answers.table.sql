CREATE TABLE [dbo].[p_answers] (
    [id]          INT            IDENTITY (72, 1) NOT NULL,
    [question_id] INT            NOT NULL,
    [answer]      NVARCHAR (255) NULL,
    [UUID]        NVARCHAR (45)  NOT NULL
);

