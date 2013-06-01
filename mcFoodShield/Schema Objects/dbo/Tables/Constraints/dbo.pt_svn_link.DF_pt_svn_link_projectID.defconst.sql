ALTER TABLE [dbo].[pt_svn_link]
    ADD CONSTRAINT [DF_pt_svn_link_projectID] DEFAULT (NULL) FOR [projectID];

