ALTER TABLE [dbo].[mc_contact_activity]
    ADD CONSTRAINT [DF_mc_contact_activity_user_id] DEFAULT ('0') FOR [user_id];

