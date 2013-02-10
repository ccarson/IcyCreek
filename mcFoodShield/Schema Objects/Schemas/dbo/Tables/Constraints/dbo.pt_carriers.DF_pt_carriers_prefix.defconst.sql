ALTER TABLE [dbo].[pt_carriers]
    ADD CONSTRAINT [DF_pt_carriers_prefix] DEFAULT (NULL) FOR [prefix];

