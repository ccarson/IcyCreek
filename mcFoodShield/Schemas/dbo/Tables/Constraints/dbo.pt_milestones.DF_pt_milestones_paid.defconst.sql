ALTER TABLE [dbo].[pt_milestones]
    ADD CONSTRAINT [DF_pt_milestones_paid] DEFAULT (NULL) FOR [paid];

