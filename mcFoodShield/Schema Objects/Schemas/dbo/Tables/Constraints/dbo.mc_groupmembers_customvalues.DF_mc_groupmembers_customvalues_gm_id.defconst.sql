ALTER TABLE [dbo].[mc_groupmembers_customvalues]
    ADD CONSTRAINT [DF_mc_groupmembers_customvalues_gm_id] DEFAULT ('0') FOR [gm_id];

