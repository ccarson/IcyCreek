CREATE TABLE [dbo].[s_questions] (
    [id]                NVARCHAR (35)  NOT NULL,
    [surveyidfk]        NVARCHAR (35)  NOT NULL,
    [question]          NVARCHAR (255) NOT NULL,
    [questiontypeidfk]  NVARCHAR (35)  NOT NULL,
    [rank]              INT            NOT NULL,
    [required]          BIT            NOT NULL,
    [question_jump]     BIT            NOT NULL,
    [question_jump_ref] NVARCHAR (35)  NULL
);

