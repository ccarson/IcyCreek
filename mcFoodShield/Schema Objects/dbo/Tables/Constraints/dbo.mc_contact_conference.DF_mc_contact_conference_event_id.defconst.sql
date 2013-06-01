ALTER TABLE [dbo].[mc_contact_conference]
    ADD CONSTRAINT [DF_mc_contact_conference_event_id] DEFAULT ('0') FOR [event_id];

