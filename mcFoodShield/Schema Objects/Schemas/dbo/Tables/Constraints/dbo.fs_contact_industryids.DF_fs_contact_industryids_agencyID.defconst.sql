ALTER TABLE [dbo].[fs_contact_industryids]
    ADD CONSTRAINT [DF_fs_contact_industryids_agencyID] DEFAULT ('0') FOR [agencyID];

