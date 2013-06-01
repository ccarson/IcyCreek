CREATE TABLE [dbo].[mc_grouptypes] (
    [id]              INT            IDENTITY (20, 1) NOT NULL,
    [type_name]       NVARCHAR (50)  NULL,
    [core_id]         INT            NOT NULL,
    [typelogo]        NVARCHAR (255) NULL,
    [navstart]        NVARCHAR (50)  NULL,
    [custom_creation] BIT            NOT NULL,
    [buttons]         BIT            NOT NULL,
    [navfirstpage]    NVARCHAR (255) NULL,
    [sorttype]        INT            DEFAULT ((0)) NOT NULL
);

