ALTER TABLE [dbo].[cflm_reviews]
    ADD CONSTRAINT [DF_cflm_reviews_rating] DEFAULT ('0') FOR [rating];

