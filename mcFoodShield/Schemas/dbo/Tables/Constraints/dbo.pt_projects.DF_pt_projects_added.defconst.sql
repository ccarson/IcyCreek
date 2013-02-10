ALTER TABLE [dbo].[pt_projects]
    ADD CONSTRAINT [DF_pt_projects_added] DEFAULT (NULL) FOR [added];

