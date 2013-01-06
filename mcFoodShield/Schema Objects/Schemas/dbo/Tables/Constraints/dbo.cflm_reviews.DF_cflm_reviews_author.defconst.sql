ALTER TABLE [dbo].[cflm_reviews]
    ADD CONSTRAINT [DF_cflm_reviews_author] DEFAULT ('0') FOR [author];

