ALTER TABLE [dbo].[c_frequency]
    ADD CONSTRAINT [DF_c_frequency_frequency] DEFAULT (N'') FOR [frequency];

