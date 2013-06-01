ALTER TABLE [dbo].[pt_project_components]
    ADD CONSTRAINT [DF_pt_project_components_component] DEFAULT (NULL) FOR [component];

