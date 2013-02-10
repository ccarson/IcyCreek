ALTER TABLE [dbo].[pt_clients]
    ADD CONSTRAINT [DF_pt_clients_contactPhone] DEFAULT (NULL) FOR [contactPhone];

