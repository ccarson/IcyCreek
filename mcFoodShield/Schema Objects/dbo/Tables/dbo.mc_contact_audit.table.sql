CREATE TABLE [dbo].[mc_contact_audit] (
    [id]          INT           IDENTITY (1, 1) NOT NULL,
    [user_id]     INT           NOT NULL,
    [activity_id] INT           NOT NULL,
    [dateCreated] DATETIME      NOT NULL,
    [isSuccess]   BIT           NULL,
    [sDetails]    VARCHAR (200) NULL
);

