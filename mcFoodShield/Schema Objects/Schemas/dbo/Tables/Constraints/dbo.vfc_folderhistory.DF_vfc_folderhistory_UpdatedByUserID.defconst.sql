ALTER TABLE [dbo].[vfc_folderhistory]
    ADD CONSTRAINT [DF_vfc_folderhistory_UpdatedByUserID] DEFAULT ('0') FOR [UpdatedByUserID];

