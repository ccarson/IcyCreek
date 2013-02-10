ALTER TABLE [dbo].[mc_contact_notifies]
    ADD CONSTRAINT [DF_mc_contact_notifies_component_id] DEFAULT ('0') FOR [component_id];

