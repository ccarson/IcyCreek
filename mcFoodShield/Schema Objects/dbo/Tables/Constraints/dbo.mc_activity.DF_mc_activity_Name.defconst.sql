ALTER TABLE [dbo].[mc_activity]
    ADD CONSTRAINT [DF_mc_activity_Name] DEFAULT (N'') FOR [Name];

