ALTER TABLE [dbo].[mc_contact_conference]
    ADD CONSTRAINT [DF_mc_contact_conference_user_id] DEFAULT ('0') FOR [user_id];

