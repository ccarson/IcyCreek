CREATE TABLE [dbo].[sme_categories_topics] (
    [id]              INT           IDENTITY (1, 1) NOT NULL,
    [smeCategoriesID] INT           NOT NULL,
    [smeTopicsID]     INT           NOT NULL,
    [createdBy]       INT           NOT NULL,
    [createdDate]     DATETIME2 (0) NOT NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'cross-reference showing smeTopics and the Categories into which users have grouped them.

A given topic may appear in multiple categories.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sme_categories_topics';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'unique identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sme_categories_topics', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'( FK ) identifier for the smeCategory', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sme_categories_topics', @level2type = N'COLUMN', @level2name = N'smeCategoriesID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'( FK ) identifier for the smeTopic', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sme_categories_topics', @level2type = N'COLUMN', @level2name = N'smeTopicsID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'user who added the topic to the category', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sme_categories_topics', @level2type = N'COLUMN', @level2name = N'createdBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'timestamp for when user added topic to category', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sme_categories_topics', @level2type = N'COLUMN', @level2name = N'createdDate';

