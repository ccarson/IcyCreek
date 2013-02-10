ALTER TABLE [dbo].[keywords]
    ADD CONSTRAINT [DF_keywords_icreatedby] DEFAULT ('0') FOR [icreatedby];

