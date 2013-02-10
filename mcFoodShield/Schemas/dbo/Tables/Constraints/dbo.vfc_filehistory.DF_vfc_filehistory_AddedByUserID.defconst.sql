ALTER TABLE [dbo].[vfc_filehistory]
    ADD CONSTRAINT [DF_vfc_filehistory_AddedByUserID] DEFAULT ('0') FOR [AddedByUserID];

