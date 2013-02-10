CREATE TABLE [dbo].[conf_subquestions_default] (
    [id]                   INT            IDENTITY (1, 1) NOT NULL,
    [question_id]          INT            NOT NULL,
    [sub_question]         NVARCHAR (MAX) NOT NULL,
    [sub_question_type_id] INT            NOT NULL
);

