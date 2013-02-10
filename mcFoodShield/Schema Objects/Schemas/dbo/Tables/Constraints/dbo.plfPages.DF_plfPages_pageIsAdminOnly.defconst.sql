ALTER TABLE [dbo].[plfPages]
    ADD CONSTRAINT [DF_plfPages_pageIsAdminOnly] DEFAULT ('NO') FOR [pageIsAdminOnly];

