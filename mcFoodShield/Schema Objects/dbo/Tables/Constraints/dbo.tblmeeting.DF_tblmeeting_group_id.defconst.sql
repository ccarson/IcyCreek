ALTER TABLE [dbo].[tblmeeting]
    ADD CONSTRAINT [DF_tblmeeting_group_id] DEFAULT ('0') FOR [group_id];

