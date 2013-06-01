ALTER TABLE [dbo].[fs_labdir_orgs]
    ADD CONSTRAINT [DF_fs_labdir_orgs_org_id] DEFAULT ('0') FOR [org_id];

