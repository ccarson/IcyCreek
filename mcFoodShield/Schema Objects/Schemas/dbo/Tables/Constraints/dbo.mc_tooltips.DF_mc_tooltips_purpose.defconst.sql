ALTER TABLE [dbo].[mc_tooltips]
    ADD CONSTRAINT [DF_mc_tooltips_purpose] DEFAULT (N'') FOR [purpose];

