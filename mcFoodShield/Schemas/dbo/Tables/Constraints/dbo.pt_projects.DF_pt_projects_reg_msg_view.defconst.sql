ALTER TABLE [dbo].[pt_projects]
    ADD CONSTRAINT [DF_pt_projects_reg_msg_view] DEFAULT (NULL) FOR [reg_msg_view];

