ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_link_id] DEFAULT ('0') FOR [link_id];

