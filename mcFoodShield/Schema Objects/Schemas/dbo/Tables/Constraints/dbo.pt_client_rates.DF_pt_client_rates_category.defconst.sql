ALTER TABLE [dbo].[pt_client_rates]
    ADD CONSTRAINT [DF_pt_client_rates_category] DEFAULT (NULL) FOR [category];

