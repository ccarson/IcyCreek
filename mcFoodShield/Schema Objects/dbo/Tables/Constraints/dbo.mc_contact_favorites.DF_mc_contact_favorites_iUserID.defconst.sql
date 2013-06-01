ALTER TABLE [dbo].[mc_contact_favorites]
    ADD CONSTRAINT [DF_mc_contact_favorites_iUserID] DEFAULT ('0') FOR [iUserID];

