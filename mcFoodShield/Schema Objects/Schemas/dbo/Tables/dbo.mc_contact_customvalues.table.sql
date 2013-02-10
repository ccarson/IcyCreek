CREATE TABLE [dbo].[mc_contact_customvalues] (
    [id]          INT            IDENTITY (36476, 1) NOT NULL,
    [field_id]    INT            NOT NULL,
    [field_value] NVARCHAR (255) NOT NULL,
    [user_id]     INT            NOT NULL
);

