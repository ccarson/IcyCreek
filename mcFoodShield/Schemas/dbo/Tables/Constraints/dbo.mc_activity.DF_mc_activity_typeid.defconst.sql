ALTER TABLE [dbo].[mc_activity]
    ADD CONSTRAINT [DF_mc_activity_typeid] DEFAULT ('0') FOR [typeid];

