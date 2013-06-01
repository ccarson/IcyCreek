ALTER TABLE [dbo].[pt_carriers]
    ADD CONSTRAINT [DF_pt_carriers_suffix] DEFAULT (NULL) FOR [suffix];

