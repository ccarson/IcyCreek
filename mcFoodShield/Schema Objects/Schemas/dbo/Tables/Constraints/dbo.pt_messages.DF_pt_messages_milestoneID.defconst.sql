ALTER TABLE [dbo].[pt_messages]
    ADD CONSTRAINT [DF_pt_messages_milestoneID] DEFAULT (NULL) FOR [milestoneID];

