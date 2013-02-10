ALTER TABLE [dbo].[ReportWatchList]
    ADD CONSTRAINT [DF_ReportWatchList_alertRate] DEFAULT ((0)) FOR [alertRate];

