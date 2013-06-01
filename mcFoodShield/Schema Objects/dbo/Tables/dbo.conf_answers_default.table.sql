CREATE TABLE [dbo].[conf_answers_default] (
    [id]              INT            IDENTITY (1, 1) NOT NULL,
    [question_id]     INT            NOT NULL,
    [sub_question_id] INT            NOT NULL,
    [answer_value]    NVARCHAR (MAX) NOT NULL,
    [user_id]         INT            NOT NULL,
    [event_id]        INT            NOT NULL
);

