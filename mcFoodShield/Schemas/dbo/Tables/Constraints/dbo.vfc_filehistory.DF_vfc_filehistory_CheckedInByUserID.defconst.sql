ALTER TABLE [dbo].[vfc_filehistory]
    ADD CONSTRAINT [DF_vfc_filehistory_CheckedInByUserID] DEFAULT ('0') FOR [CheckedInByUserID];

