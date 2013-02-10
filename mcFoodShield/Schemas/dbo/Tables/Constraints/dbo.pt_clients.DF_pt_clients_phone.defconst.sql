ALTER TABLE [dbo].[pt_clients]
    ADD CONSTRAINT [DF_pt_clients_phone] DEFAULT (NULL) FOR [phone];

