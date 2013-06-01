ALTER TABLE [dbo].[c_frequency]
    ADD CONSTRAINT [DF_c_frequency_freq_value] DEFAULT ('0') FOR [freq_value];

