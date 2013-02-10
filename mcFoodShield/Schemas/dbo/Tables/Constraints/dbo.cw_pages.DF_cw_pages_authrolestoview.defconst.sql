ALTER TABLE [dbo].[cw_pages]
    ADD CONSTRAINT [DF_cw_pages_authrolestoview] DEFAULT (NULL) FOR [authrolestoview];

