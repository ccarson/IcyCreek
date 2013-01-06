ALTER TABLE [dbo].[pt_issues]
    ADD CONSTRAINT [DF_pt_issues_updatedBy] DEFAULT (NULL) FOR [updatedBy];

