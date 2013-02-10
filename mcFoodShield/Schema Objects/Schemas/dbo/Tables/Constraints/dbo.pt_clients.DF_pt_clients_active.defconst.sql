ALTER TABLE [dbo].[pt_clients]
    ADD CONSTRAINT [DF_pt_clients_active] DEFAULT (NULL) FOR [active];

