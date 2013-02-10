ALTER TABLE [dbo].[fs_allhazard_classifications]
    ADD CONSTRAINT [DF_fs_allhazard_classifications_active] DEFAULT ((0)) FOR [active];

