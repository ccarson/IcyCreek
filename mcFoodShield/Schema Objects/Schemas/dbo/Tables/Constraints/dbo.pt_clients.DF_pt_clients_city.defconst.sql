ALTER TABLE [dbo].[pt_clients]
    ADD CONSTRAINT [DF_pt_clients_city] DEFAULT (NULL) FOR [city];

