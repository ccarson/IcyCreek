ALTER TABLE [dbo].[c_suffix]
    ADD CONSTRAINT [DF_c_suffix_isActive] DEFAULT ((1)) FOR [isActive];

