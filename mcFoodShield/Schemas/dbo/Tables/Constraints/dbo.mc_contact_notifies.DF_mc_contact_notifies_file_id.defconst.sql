ALTER TABLE [dbo].[mc_contact_notifies]
    ADD CONSTRAINT [DF_mc_contact_notifies_file_id] DEFAULT ('0') FOR [file_id];

