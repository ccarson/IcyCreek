CREATE TABLE [dbo].[mc_contact_feeds] (
    [id]       INT IDENTITY (1, 1) NOT NULL,
    [user_id]  INT NOT NULL,
    [feeds_id] INT NOT NULL,
    [active]   BIT NULL
);

