CREATE TABLE [dbo].[cflm_reviews] (
    [reviewid] FLOAT          NOT NULL,
    [linkid]   FLOAT          NULL,
    [rating]   FLOAT          NULL,
    [title]    NVARCHAR (50)  NULL,
    [comments] NVARCHAR (MAX) NULL,
    [author]   FLOAT          NULL
);

