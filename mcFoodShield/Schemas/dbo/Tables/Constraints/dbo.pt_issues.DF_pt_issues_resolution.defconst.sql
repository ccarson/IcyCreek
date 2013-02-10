ALTER TABLE [dbo].[pt_issues]
    ADD CONSTRAINT [DF_pt_issues_resolution] DEFAULT (NULL) FOR [resolution];

