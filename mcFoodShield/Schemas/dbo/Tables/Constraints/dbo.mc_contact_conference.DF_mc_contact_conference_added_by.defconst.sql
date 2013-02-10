ALTER TABLE [dbo].[mc_contact_conference]
    ADD CONSTRAINT [DF_mc_contact_conference_added_by] DEFAULT ('0') FOR [added_by];

