ALTER TABLE [dbo].[smeAcademicUniversities]
    ADD CONSTRAINT [PK_refCollegesUniversities] PRIMARY KEY CLUSTERED ([id] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'primary clustering index', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'smeAcademicUniversities', @level2type = N'CONSTRAINT', @level2name = N'PK_refCollegesUniversities';

