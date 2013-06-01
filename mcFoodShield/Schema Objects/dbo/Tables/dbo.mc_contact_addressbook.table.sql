CREATE TABLE [dbo].[mc_contact_addressbook] (
    [id]         INT IDENTITY (37, 1) NOT NULL,
    [user_id]    INT NOT NULL,
    [contact_id] INT NOT NULL,
    [group_id]   INT NOT NULL,
    [favorite]   INT NOT NULL
);

