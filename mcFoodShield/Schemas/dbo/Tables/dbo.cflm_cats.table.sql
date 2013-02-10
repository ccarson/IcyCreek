CREATE TABLE [dbo].[cflm_cats] (
    [categoryid]    INT            IDENTITY (4, 1) NOT NULL,
    [parentid]      INT            NOT NULL,
    [category_name] NVARCHAR (100) NOT NULL,
    [is_active]     BIT            NOT NULL,
    [order_by]      INT            NOT NULL,
    [group_id]      INT            NOT NULL
);

