CREATE TABLE [dbo].[quicklinks] (
    [id]            INT            IDENTITY (1, 1) NOT NULL,
    [user_id]       INT            NOT NULL,
    [dtDateCreated] DATETIME       NULL,
    [slink]         NVARCHAR (300) NOT NULL,
    [iorder]        INT            NOT NULL,
    [sname]         NVARCHAR (200) NOT NULL,
    [sdescription]  NVARCHAR (500) NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);

