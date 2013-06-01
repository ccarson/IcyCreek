ALTER TABLE [dbo].[pt_projects]
    ADD CONSTRAINT [DF_pt_projects_clientID] DEFAULT (NULL) FOR [clientID];

