ALTER TABLE [dbo].[c_networks]
    ADD CONSTRAINT [DF_c_networks_custom_id] DEFAULT ((0)) FOR [custom_id];

