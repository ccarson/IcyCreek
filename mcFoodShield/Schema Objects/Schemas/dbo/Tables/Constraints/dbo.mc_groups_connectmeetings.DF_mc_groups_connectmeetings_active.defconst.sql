ALTER TABLE [dbo].[mc_groups_connectmeetings]
    ADD CONSTRAINT [DF_mc_groups_connectmeetings_active] DEFAULT ((0)) FOR [active];

