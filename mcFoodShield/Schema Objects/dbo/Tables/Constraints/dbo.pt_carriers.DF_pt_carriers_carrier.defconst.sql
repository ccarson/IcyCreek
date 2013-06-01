ALTER TABLE [dbo].[pt_carriers]
    ADD CONSTRAINT [DF_pt_carriers_carrier] DEFAULT (NULL) FOR [carrier];

