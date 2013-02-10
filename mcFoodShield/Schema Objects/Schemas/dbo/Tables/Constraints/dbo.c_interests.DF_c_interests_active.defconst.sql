ALTER TABLE [dbo].[c_interests]
    ADD CONSTRAINT [DF_c_interests_active] DEFAULT ((0)) FOR [active];

