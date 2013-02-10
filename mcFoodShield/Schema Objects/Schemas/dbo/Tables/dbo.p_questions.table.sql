CREATE TABLE [dbo].[p_questions] (
    [id]            INT            IDENTITY (24, 1) NOT NULL,
    [poll_id]       INT            NOT NULL,
    [question]      NVARCHAR (255) NULL,
    [question_type] NVARCHAR (50)  NULL,
    [required]      BIT            NOT NULL,
    [active]        BIT            NOT NULL
);

