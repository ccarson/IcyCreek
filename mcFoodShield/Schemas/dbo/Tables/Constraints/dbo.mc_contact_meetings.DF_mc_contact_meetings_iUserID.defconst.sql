ALTER TABLE [dbo].[mc_contact_meetings]
    ADD CONSTRAINT [DF_mc_contact_meetings_iUserID] DEFAULT ('0') FOR [iUserID];

