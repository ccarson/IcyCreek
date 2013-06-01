ALTER TABLE [dbo].[pt_issues]
    ADD CONSTRAINT [DF_pt_issues_versionID] DEFAULT (NULL) FOR [versionID];

