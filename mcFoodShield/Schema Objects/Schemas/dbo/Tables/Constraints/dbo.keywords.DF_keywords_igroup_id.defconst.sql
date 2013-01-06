ALTER TABLE [dbo].[keywords]
    ADD CONSTRAINT [DF_keywords_igroup_id] DEFAULT ('0') FOR [igroup_id];

