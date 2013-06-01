ALTER TABLE [dbo].[pt_clients]
    ADD CONSTRAINT [DF_pt_clients_name] DEFAULT (NULL) FOR [name];

