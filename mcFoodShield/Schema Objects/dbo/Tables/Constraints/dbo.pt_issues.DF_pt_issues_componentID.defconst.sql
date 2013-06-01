ALTER TABLE [dbo].[pt_issues]
    ADD CONSTRAINT [DF_pt_issues_componentID] DEFAULT (NULL) FOR [componentID];

