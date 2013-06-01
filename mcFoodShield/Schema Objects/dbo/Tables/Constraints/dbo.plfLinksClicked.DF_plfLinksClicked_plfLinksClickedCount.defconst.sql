ALTER TABLE [dbo].[plfLinksClicked]
    ADD CONSTRAINT [DF_plfLinksClicked_plfLinksClickedCount] DEFAULT ('0') FOR [plfLinksClickedCount];

