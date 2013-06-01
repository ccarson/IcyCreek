CREATE TABLE [dbo].[sme_categories] (
    [id]           INT            IDENTITY (1, 1) NOT NULL,
    [name]         NVARCHAR (100) NOT NULL,
    [description]  NVARCHAR (200) NOT NULL,
    [createdBy]    INT            NOT NULL,
    [createdDate]  DATETIME2 (0)  NOT NULL,
    [modifiedBy]   INT            NULL,
    [modifiedDate] DATETIME2 (0)  NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'smeCategories represent broad areas of interest that contain one or more smeTopics.

users can create smeCategories, and place topics into them for highly refined searching capabilities.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sme_categories';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'unique identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sme_categories', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'category name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sme_categories', @level2type = N'COLUMN', @level2name = N'name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'detailed description of category', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sme_categories', @level2type = N'COLUMN', @level2name = N'description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'user who created category', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sme_categories', @level2type = N'COLUMN', @level2name = N'createdBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'date category was created', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sme_categories', @level2type = N'COLUMN', @level2name = N'createdDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'last user to modify category', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sme_categories', @level2type = N'COLUMN', @level2name = N'modifiedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'last date that category was modified', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sme_categories', @level2type = N'COLUMN', @level2name = N'modifiedDate';

