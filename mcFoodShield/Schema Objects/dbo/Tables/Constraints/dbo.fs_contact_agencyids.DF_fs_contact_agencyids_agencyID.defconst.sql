ALTER TABLE [dbo].[fs_contact_agencyids]
    ADD CONSTRAINT [DF_fs_contact_agencyids_agencyID] DEFAULT ('0') FOR [agencyID];

