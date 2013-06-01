ALTER TABLE [dbo].[fs_contact_labids]
    ADD CONSTRAINT [DF_fs_contact_labids_OLD_agency_id] DEFAULT ('0') FOR [OLD_agency_id];

