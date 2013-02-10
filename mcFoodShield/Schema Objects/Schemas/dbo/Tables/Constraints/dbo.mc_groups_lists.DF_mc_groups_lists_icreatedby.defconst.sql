ALTER TABLE [dbo].[mc_groups_lists]
    ADD CONSTRAINT [DF_mc_groups_lists_icreatedby] DEFAULT ('0') FOR [icreatedby];

