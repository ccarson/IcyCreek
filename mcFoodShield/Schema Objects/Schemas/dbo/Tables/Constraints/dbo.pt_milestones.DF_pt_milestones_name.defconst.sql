ALTER TABLE [dbo].[pt_milestones]
    ADD CONSTRAINT [DF_pt_milestones_name] DEFAULT (NULL) FOR [name];

