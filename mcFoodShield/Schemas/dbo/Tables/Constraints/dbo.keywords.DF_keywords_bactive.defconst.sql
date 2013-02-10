ALTER TABLE [dbo].[keywords]
    ADD CONSTRAINT [DF_keywords_bactive] DEFAULT ((1)) FOR [bactive];

