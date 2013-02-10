ALTER TABLE [dbo].[pt_carriers]
    ADD CONSTRAINT [DF_pt_carriers_country] DEFAULT (NULL) FOR [country];

