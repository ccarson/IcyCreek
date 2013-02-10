CREATE TABLE [dbo].[s_answers] (
    [id]                NVARCHAR (35)  NOT NULL,
    [questionidfk]      NVARCHAR (35)  NOT NULL,
    [answer]            NVARCHAR (255) NOT NULL,
    [rank]              INT            NOT NULL,
    [question_jump]     BIT            NOT NULL,
    [question_jump_ref] NVARCHAR (35)  NULL
);

