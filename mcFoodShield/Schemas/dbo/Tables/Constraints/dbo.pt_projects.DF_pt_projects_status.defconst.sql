ALTER TABLE [dbo].[pt_projects]
    ADD CONSTRAINT [DF_pt_projects_status] DEFAULT (NULL) FOR [status];

