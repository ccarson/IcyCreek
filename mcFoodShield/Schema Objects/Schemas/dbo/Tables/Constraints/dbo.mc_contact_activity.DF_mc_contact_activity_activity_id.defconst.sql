ALTER TABLE [dbo].[mc_contact_activity]
    ADD CONSTRAINT [DF_mc_contact_activity_activity_id] DEFAULT ('0') FOR [activity_id];

