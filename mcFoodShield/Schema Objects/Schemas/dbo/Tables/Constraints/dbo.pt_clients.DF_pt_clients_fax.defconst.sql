ALTER TABLE [dbo].[pt_clients]
    ADD CONSTRAINT [DF_pt_clients_fax] DEFAULT (NULL) FOR [fax];

