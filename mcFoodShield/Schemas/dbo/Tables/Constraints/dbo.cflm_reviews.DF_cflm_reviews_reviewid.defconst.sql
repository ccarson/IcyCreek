ALTER TABLE [dbo].[cflm_reviews]
    ADD CONSTRAINT [DF_cflm_reviews_reviewid] DEFAULT ('0') FOR [reviewid];

