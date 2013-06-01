ALTER TABLE [dbo].[pt_project_versions]
    ADD CONSTRAINT [DF_pt_project_versions_version] DEFAULT (NULL) FOR [version];

