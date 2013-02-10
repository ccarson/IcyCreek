ALTER TABLE [dbo].[vfc_filehistory]
    ADD CONSTRAINT [DF_vfc_filehistory_FileID] DEFAULT ('0') FOR [FileID];

