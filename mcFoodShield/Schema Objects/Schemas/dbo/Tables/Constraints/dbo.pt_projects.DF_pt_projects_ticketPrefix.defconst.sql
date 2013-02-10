ALTER TABLE [dbo].[pt_projects]
    ADD CONSTRAINT [DF_pt_projects_ticketPrefix] DEFAULT (NULL) FOR [ticketPrefix];

