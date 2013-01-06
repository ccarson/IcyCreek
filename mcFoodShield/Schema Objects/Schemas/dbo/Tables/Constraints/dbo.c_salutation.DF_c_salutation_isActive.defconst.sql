ALTER TABLE [dbo].[c_salutation]
    ADD CONSTRAINT [DF_c_salutation_isActive] DEFAULT ((1)) FOR [isActive];

