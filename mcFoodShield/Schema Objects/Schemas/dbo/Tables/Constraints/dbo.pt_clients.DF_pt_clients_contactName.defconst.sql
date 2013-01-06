ALTER TABLE [dbo].[pt_clients]
    ADD CONSTRAINT [DF_pt_clients_contactName] DEFAULT (NULL) FOR [contactName];

