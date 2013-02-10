ALTER TABLE [dbo].[c_interests]
    ADD CONSTRAINT [DF_c_interests_typename] DEFAULT (N'') FOR [typename];

