ALTER TABLE [dbo].[pt_issues]
    ADD CONSTRAINT [DF_pt_issues_milestoneID] DEFAULT (NULL) FOR [milestoneID];

