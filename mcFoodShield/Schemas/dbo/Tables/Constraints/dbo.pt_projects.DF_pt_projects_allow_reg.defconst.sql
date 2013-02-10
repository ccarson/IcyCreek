ALTER TABLE [dbo].[pt_projects]
    ADD CONSTRAINT [DF_pt_projects_allow_reg] DEFAULT (NULL) FOR [allow_reg];

