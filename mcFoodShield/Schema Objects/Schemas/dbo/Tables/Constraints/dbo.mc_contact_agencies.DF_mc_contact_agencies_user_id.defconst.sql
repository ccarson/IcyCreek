ALTER TABLE [dbo].[mc_contact_agencies]
    ADD CONSTRAINT [DF_mc_contact_agencies_user_id] DEFAULT ('0') FOR [user_id];

