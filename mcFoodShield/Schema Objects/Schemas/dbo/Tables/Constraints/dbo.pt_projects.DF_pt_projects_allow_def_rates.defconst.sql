ALTER TABLE [dbo].[pt_projects]
    ADD CONSTRAINT [DF_pt_projects_allow_def_rates] DEFAULT (NULL) FOR [allow_def_rates];

