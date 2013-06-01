ALTER TABLE [dbo].[mc_groupnotes]
    ADD CONSTRAINT [DF_mc_groupnotes_bactive] DEFAULT ((1)) FOR [bactive];

