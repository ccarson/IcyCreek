CREATE TABLE [dbo].[kb_categories] (
    [CategoryID]   INT            IDENTITY (115, 1) NOT NULL,
    [CategoryName] NVARCHAR (MAX) NULL,
    [order_by]     FLOAT          NULL,
    [group_id]     INT            NOT NULL,
    [parentid]     INT            NOT NULL,
    [bactive]      BIT            NOT NULL
);

