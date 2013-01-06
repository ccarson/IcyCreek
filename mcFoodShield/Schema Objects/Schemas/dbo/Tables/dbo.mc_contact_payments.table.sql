CREATE TABLE [dbo].[mc_contact_payments] (
    [id]          INT           IDENTITY (342, 1) NOT NULL,
    [type_id]     INT           NOT NULL,
    [user_id]     INT           NOT NULL,
    [activity_id] INT           NOT NULL,
    [paid]        INT           NOT NULL,
    [checknum]    NVARCHAR (25) NULL,
    [changedate]  DATETIME2 (0) NULL,
    [cardnum]     INT           NULL,
    [term_id]     INT           NOT NULL
);

