ALTER TABLE [dbo].[c_networks]
    ADD CONSTRAINT [DF_c_networks_active] DEFAULT ((1)) FOR [active];

