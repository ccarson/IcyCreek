ALTER TABLE [dbo].[navigation]
    ADD CONSTRAINT [DF_navigation_iparent_navid] DEFAULT ('0') FOR [iparent_navid];

