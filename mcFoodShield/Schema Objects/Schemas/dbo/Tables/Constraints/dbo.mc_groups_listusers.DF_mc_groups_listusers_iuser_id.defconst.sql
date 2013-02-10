ALTER TABLE [dbo].[mc_groups_listusers]
    ADD CONSTRAINT [DF_mc_groups_listusers_iuser_id] DEFAULT ('0') FOR [iuser_id];

