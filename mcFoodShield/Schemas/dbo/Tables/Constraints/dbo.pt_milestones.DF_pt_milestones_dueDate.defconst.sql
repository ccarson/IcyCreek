ALTER TABLE [dbo].[pt_milestones]
    ADD CONSTRAINT [DF_pt_milestones_dueDate] DEFAULT (NULL) FOR [dueDate];

