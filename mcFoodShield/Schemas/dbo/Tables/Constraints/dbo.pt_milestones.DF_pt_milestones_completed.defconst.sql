ALTER TABLE [dbo].[pt_milestones]
    ADD CONSTRAINT [DF_pt_milestones_completed] DEFAULT (NULL) FOR [completed];

