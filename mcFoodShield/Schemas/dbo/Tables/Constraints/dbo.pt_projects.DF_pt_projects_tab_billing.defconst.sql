ALTER TABLE [dbo].[pt_projects]
    ADD CONSTRAINT [DF_pt_projects_tab_billing] DEFAULT (NULL) FOR [tab_billing];

