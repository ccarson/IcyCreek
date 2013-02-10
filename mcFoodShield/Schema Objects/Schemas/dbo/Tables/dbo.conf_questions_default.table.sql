CREATE TABLE [dbo].[conf_questions_default] (
    [id]               INT           IDENTITY (44, 1) NOT NULL,
    [question]         VARCHAR (MAX) NOT NULL,
    [question_type_id] INT           NOT NULL,
    [question_heading] VARCHAR (255) NOT NULL,
    [has_subquestion]  BIT           NOT NULL,
    [sortorder]        INT           NOT NULL,
    [active]           BIT           NOT NULL
);

