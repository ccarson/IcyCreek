ALTER TABLE [dbo].[plfPages]
    ADD CONSTRAINT [DF_plfPages_pageParentId] DEFAULT ('0') FOR [pageParentId];

