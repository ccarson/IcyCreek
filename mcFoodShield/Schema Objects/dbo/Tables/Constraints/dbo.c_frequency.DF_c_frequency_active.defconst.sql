ALTER TABLE [dbo].[c_frequency]
    ADD CONSTRAINT [DF_c_frequency_active] DEFAULT ((0)) FOR [active];

