ALTER TABLE [dbo].[mc_activitytype]
    ADD CONSTRAINT [DF_mc_activitytype_active] DEFAULT ((0)) FOR [active];

