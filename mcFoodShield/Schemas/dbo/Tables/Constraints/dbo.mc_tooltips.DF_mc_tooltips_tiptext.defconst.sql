ALTER TABLE [dbo].[mc_tooltips]
    ADD CONSTRAINT [DF_mc_tooltips_tiptext] DEFAULT (N'') FOR [tiptext];

