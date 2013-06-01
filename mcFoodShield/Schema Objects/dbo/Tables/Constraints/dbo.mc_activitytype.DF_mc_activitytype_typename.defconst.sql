ALTER TABLE [dbo].[mc_activitytype]
    ADD CONSTRAINT [DF_mc_activitytype_typename] DEFAULT (N'') FOR [typename];

