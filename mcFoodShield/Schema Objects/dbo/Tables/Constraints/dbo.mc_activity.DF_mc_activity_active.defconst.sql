ALTER TABLE [dbo].[mc_activity]
    ADD CONSTRAINT [DF_mc_activity_active] DEFAULT ((0)) FOR [active];

