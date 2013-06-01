ALTER TABLE [dbo].[plfSubscriberLinksClicked]
    ADD CONSTRAINT [FK_plfSubscriberLinksClicked_plfLinksClicked] FOREIGN KEY ([linkId]) REFERENCES [dbo].[plfLinksClicked] ([plfLinksClickedId]) ON DELETE NO ACTION ON UPDATE NO ACTION;

