ALTER TABLE [dbo].[mc_groups_listusers]
    ADD CONSTRAINT [DF_mc_groups_listusers_ilist_id] DEFAULT ('0') FOR [ilist_id];

