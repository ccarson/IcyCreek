CREATE TABLE [dbo].[p_results] (
    [id]          INT            IDENTITY (56, 1) NOT NULL,
    [poll_id]     INT            NOT NULL,
    [question_id] INT            NOT NULL,
    [answer_id]   INT            NOT NULL,
    [answer]      NVARCHAR (255) NULL,
    [user_id]     INT            NULL
);

