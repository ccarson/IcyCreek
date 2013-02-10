ALTER TABLE [dbo].[keywords]
    ADD CONSTRAINT [DF_keywords_iapp_id] DEFAULT ('0') FOR [iapp_id];

