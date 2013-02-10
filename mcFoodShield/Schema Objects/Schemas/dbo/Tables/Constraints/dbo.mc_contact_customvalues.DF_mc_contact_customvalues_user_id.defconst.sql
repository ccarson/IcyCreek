ALTER TABLE [dbo].[mc_contact_customvalues]
    ADD CONSTRAINT [DF_mc_contact_customvalues_user_id] DEFAULT ('0') FOR [user_id];

