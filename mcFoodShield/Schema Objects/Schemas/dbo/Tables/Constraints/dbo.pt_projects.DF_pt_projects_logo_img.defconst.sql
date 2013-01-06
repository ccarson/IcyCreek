ALTER TABLE [dbo].[pt_projects]
    ADD CONSTRAINT [DF_pt_projects_logo_img] DEFAULT (NULL) FOR [logo_img];

