ALTER TABLE [dbo].[vfc_file]
    ADD CONSTRAINT [DF_vfc_file_threadID] DEFAULT (N'0') FOR [threadID];

