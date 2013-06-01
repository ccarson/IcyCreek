ALTER TABLE [dbo].[pt_clients]
    ADD CONSTRAINT [DF_pt_clients_locality] DEFAULT (NULL) FOR [locality];

