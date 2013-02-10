ALTER TABLE [dbo].[plfSuppressionList]
    ADD CONSTRAINT [DF_plfSuppressionList_clientId] DEFAULT ('0') FOR [clientId];

