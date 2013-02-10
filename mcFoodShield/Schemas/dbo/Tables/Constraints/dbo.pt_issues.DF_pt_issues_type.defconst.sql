ALTER TABLE [dbo].[pt_issues]
    ADD CONSTRAINT [DF_pt_issues_type] DEFAULT (NULL) FOR [type];

