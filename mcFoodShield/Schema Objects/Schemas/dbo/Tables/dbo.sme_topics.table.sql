CREATE TABLE [dbo].[sme_topics] (
    [id]            INT            IDENTITY (1, 1) NOT NULL,
    [name]          NVARCHAR (200) NOT NULL,
    [alternateName] NVARCHAR (MAX) NOT NULL,
    [description]   NVARCHAR (MAX) NOT NULL,
    [createdBy]     INT            NOT NULL,
    [createdDate]   DATETIME2 (0)  NOT NULL,
    [modifiedBy]    INT            NULL,
    [modifiedDate]  DATETIME2 (0)  NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A specific area of knowledge about which system users are seeking experts.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sme_topics';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'unique identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sme_topics', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Topic name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sme_topics', @level2type = N'COLUMN', @level2name = N'name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'alternate names for topic -- this column has Full-Text Search enabled', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sme_topics', @level2type = N'COLUMN', @level2name = N'alternateName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'detailed description of the Topic', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sme_topics', @level2type = N'COLUMN', @level2name = N'description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'user who added the topic', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sme_topics', @level2type = N'COLUMN', @level2name = N'createdBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'timestamp of when the topic was added', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sme_topics', @level2type = N'COLUMN', @level2name = N'createdDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'last user to modify the topic', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sme_topics', @level2type = N'COLUMN', @level2name = N'modifiedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'timestamp of the last modification of the topic', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sme_topics', @level2type = N'COLUMN', @level2name = N'modifiedDate';

