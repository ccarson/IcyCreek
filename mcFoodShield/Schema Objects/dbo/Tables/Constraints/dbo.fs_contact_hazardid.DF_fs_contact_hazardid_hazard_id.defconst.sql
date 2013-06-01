ALTER TABLE [dbo].[fs_contact_hazardid]
    ADD CONSTRAINT [DF_fs_contact_hazardid_hazard_id] DEFAULT ('0') FOR [hazard_id];

