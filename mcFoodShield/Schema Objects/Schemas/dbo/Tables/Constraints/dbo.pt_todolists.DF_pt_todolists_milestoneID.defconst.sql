ALTER TABLE [dbo].[pt_todolists]
    ADD CONSTRAINT [DF_pt_todolists_milestoneID] DEFAULT (NULL) FOR [milestoneID];

