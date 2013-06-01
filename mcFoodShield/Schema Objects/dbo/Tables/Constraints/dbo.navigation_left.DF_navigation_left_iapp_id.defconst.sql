ALTER TABLE [dbo].[navigation_left]
    ADD CONSTRAINT [DF_navigation_left_iapp_id] DEFAULT ('0') FOR [iapp_id];

