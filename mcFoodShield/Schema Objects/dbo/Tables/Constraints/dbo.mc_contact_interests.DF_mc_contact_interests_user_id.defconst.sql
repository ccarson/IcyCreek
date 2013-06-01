ALTER TABLE [dbo].[mc_contact_interests]
    ADD CONSTRAINT [DF_mc_contact_interests_user_id] DEFAULT ('0') FOR [user_id];

