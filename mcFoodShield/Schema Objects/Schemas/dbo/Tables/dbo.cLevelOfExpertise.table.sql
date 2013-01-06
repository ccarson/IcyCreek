CREATE TABLE [dbo].[cLevelOfExpertise] (
    [id]               INT            NOT NULL,
    [levelOfExpertise] NVARCHAR (50)  NOT NULL,
    [description]      NVARCHAR (200) NOT NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'codes tables defining different levels of expertise that a subject mater expert may posess', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cLevelOfExpertise';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'unique identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cLevelOfExpertise', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'level of expertise', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cLevelOfExpertise', @level2type = N'COLUMN', @level2name = N'levelOfExpertise';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'detailed description of the criteria that apply to a given level of expertise', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cLevelOfExpertise', @level2type = N'COLUMN', @level2name = N'description';

