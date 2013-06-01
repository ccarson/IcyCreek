ALTER TABLE [dbo].[cflm_reviews]
    ADD CONSTRAINT [DF_cflm_reviews_linkid] DEFAULT ('0') FOR [linkid];

