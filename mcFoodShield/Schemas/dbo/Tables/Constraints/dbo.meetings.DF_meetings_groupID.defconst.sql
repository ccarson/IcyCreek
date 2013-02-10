ALTER TABLE [dbo].[meetings]
    ADD CONSTRAINT [DF_meetings_groupID] DEFAULT ((0)) FOR [groupID];

