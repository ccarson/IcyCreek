ALTER TABLE [dbo].[pt_issues]
    ADD CONSTRAINT [DF_pt_issues_shortID] DEFAULT (NULL) FOR [shortID];

