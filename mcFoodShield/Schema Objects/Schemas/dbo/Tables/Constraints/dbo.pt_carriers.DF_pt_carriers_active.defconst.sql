ALTER TABLE [dbo].[pt_carriers]
    ADD CONSTRAINT [DF_pt_carriers_active] DEFAULT (NULL) FOR [active];

