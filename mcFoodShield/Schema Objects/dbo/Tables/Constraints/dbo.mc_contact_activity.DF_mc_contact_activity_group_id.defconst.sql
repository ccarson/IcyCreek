ALTER TABLE [dbo].[mc_contact_activity]
    ADD CONSTRAINT [DF_mc_contact_activity_group_id] DEFAULT ('0') FOR [group_id];

