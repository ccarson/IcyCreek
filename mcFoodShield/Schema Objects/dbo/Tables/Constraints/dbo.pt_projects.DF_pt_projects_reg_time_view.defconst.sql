ALTER TABLE [dbo].[pt_projects]
    ADD CONSTRAINT [DF_pt_projects_reg_time_view] DEFAULT (NULL) FOR [reg_time_view];

