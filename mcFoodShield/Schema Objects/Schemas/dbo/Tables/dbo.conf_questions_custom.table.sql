CREATE TABLE [dbo].[conf_questions_custom] (
    [id]               INT            IDENTITY (9, 1) NOT NULL,
    [question]         NVARCHAR (MAX) NOT NULL,
    [question_type_id] INT            NOT NULL,
    [event_id]         INT            NOT NULL,
    [question_heading] NVARCHAR (255) NOT NULL,
    [has_subquestion]  BIT            NOT NULL,
    [sortorder]        INT            NOT NULL,
    [active]           BIT            NOT NULL
);

