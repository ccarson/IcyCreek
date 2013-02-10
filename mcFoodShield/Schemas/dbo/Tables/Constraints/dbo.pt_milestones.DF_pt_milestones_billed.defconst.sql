ALTER TABLE [dbo].[pt_milestones]
    ADD CONSTRAINT [DF_pt_milestones_billed] DEFAULT (NULL) FOR [billed];

