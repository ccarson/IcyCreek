ALTER TABLE [dbo].[mc_contact_agencies]
    ADD CONSTRAINT [DF_mc_contact_agencies_lab_id] DEFAULT ('0') FOR [lab_id];

