ALTER TABLE [dbo].[quicklinks]
    ADD CONSTRAINT [DF_quicklinks_iorder] DEFAULT ((0)) FOR [iorder];

