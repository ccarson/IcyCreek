CREATE TABLE [dbo].[mc_contact_interests] (
    [id]          INT IDENTITY (1, 1) NOT NULL,
    [user_id]     INT NOT NULL,
    [interest_id] INT NOT NULL,
    [active]      BIT NOT NULL
);

