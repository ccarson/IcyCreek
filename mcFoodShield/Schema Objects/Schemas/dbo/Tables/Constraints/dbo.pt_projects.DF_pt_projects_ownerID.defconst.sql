ALTER TABLE [dbo].[pt_projects]
    ADD CONSTRAINT [DF_pt_projects_ownerID] DEFAULT (NULL) FOR [ownerID];

