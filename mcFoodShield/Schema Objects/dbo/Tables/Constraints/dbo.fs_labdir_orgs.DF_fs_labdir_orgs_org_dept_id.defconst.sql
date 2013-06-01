ALTER TABLE [dbo].[fs_labdir_orgs]
    ADD CONSTRAINT [DF_fs_labdir_orgs_org_dept_id] DEFAULT ('0') FOR [org_dept_id];

