ALTER TABLE [dbo].[tblgroup]
    ADD CONSTRAINT [DF_tblgroup_groupName] DEFAULT ('') FOR [groupName];

