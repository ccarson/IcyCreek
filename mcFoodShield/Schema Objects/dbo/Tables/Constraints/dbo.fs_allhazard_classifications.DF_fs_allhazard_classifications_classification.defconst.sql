ALTER TABLE [dbo].[fs_allhazard_classifications]
    ADD CONSTRAINT [DF_fs_allhazard_classifications_classification] DEFAULT (N'') FOR [classification];

