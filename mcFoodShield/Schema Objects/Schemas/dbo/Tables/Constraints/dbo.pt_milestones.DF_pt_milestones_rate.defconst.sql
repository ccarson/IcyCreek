ALTER TABLE [dbo].[pt_milestones]
    ADD CONSTRAINT [DF_pt_milestones_rate] DEFAULT (NULL) FOR [rate];

