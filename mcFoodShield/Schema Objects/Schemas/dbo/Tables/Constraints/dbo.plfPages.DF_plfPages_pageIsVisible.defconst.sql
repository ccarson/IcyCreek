ALTER TABLE [dbo].[plfPages]
    ADD CONSTRAINT [DF_plfPages_pageIsVisible] DEFAULT ('YES') FOR [pageIsVisible];

