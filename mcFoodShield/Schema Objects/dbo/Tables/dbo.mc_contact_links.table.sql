CREATE TABLE [dbo].[mc_contact_links] (
    [id]         INT            IDENTITY (1, 1) NOT NULL,
    [linkTypeID] INT            NOT NULL,
    [userID]     INT            NOT NULL,
    [linkURL]    NVARCHAR (100) NOT NULL
);

