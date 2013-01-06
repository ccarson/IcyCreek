ALTER TABLE [dbo].[pt_clients]
    ADD CONSTRAINT [DF_pt_clients_postal] DEFAULT (NULL) FOR [postal];

