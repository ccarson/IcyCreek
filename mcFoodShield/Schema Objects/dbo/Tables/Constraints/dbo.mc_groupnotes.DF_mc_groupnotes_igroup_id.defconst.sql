ALTER TABLE [dbo].[mc_groupnotes]
    ADD CONSTRAINT [DF_mc_groupnotes_igroup_id] DEFAULT ('0') FOR [igroup_id];

