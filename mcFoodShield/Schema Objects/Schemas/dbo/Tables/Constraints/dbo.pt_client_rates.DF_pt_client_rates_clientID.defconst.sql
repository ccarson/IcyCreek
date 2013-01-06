ALTER TABLE [dbo].[pt_client_rates]
    ADD CONSTRAINT [DF_pt_client_rates_clientID] DEFAULT (NULL) FOR [clientID];

