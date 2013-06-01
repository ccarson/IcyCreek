CREATE TABLE [dbo].[conf_questions_custom] (
    [id]               INT             IDENTITY (9, 1) NOT NULL,
    [question]         NVARCHAR (MAX)  NOT NULL,
    [question_type_id] INT             NOT NULL,
    [event_id]         INT             NOT NULL,
    [question_heading] NVARCHAR (1000) NOT NULL,
    [has_subquestion]  BIT             CONSTRAINT [DF_conf_questions_custom_has_subquestion] DEFAULT ((0)) NOT NULL,
    [sortorder]        INT             NOT NULL,
    [active]           BIT             CONSTRAINT [DF_conf_questions_custom_active] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_conf_questions_custom_id] PRIMARY KEY CLUSTERED ([id] ASC)
);



