ALTER TABLE [dbo].[pt_carriers]
    ADD CONSTRAINT [DF_pt_carriers_countryCode] DEFAULT (NULL) FOR [countryCode];

