ALTER TABLE [dbo].[plfPages]
    ADD CONSTRAINT [DF_plfPages_pageDisplayOrder] DEFAULT ('10') FOR [pageDisplayOrder];

