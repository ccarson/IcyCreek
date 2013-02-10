ALTER TABLE [dbo].[ReportWatchList]
    ADD CONSTRAINT [DF_ReportWatchList_isActive] DEFAULT ((1)) FOR [isActive];

