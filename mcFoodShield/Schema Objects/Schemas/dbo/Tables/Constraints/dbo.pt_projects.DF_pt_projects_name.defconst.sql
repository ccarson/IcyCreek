ALTER TABLE [dbo].[pt_projects]
    ADD CONSTRAINT [DF_pt_projects_name] DEFAULT (NULL) FOR [name];

