ALTER TABLE [dbo].[fs_foodag_orgs]
    ADD CONSTRAINT [DF_fs_foodag_orgs_org_dept_id] DEFAULT ('0') FOR [org_dept_id];

