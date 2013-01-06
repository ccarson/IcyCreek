ALTER TABLE [dbo].[fs_contact_hazardid]
    ADD CONSTRAINT [DF_fs_contact_hazardid_state_jurisdiction] DEFAULT (N'') FOR [state_jurisdiction];

