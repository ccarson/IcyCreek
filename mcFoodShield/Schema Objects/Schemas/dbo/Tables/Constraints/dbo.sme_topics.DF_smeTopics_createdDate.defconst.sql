ALTER TABLE [dbo].[sme_topics]
    ADD CONSTRAINT [DF_smeTopics_createdDate] DEFAULT (getdate()) FOR [createdDate];

