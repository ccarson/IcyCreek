ALTER TABLE [dbo].[pt_clients]
    ADD CONSTRAINT [DF_pt_clients_website] DEFAULT (NULL) FOR [website];

