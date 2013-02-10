ALTER TABLE [dbo].[pt_clients]
    ADD CONSTRAINT [DF_pt_clients_country] DEFAULT (NULL) FOR [country];

