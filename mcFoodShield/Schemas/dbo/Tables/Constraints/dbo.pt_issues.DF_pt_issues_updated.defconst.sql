ALTER TABLE [dbo].[pt_issues]
    ADD CONSTRAINT [DF_pt_issues_updated] DEFAULT (NULL) FOR [updated];

