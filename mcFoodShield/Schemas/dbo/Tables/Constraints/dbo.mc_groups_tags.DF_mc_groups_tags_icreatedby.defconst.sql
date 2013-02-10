ALTER TABLE [dbo].[mc_groups_tags]
    ADD CONSTRAINT [DF_mc_groups_tags_icreatedby] DEFAULT ('0') FOR [icreatedby];

