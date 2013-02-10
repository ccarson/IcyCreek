ALTER TABLE [dbo].[mc_contact_links]
    ADD CONSTRAINT [FK_mc_contact_links_mc_contact_link_types] FOREIGN KEY ([linkTypeID]) REFERENCES [dbo].[mc_contact_link_types] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

