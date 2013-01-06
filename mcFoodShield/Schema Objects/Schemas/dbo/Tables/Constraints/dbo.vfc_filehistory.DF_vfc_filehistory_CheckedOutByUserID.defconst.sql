ALTER TABLE [dbo].[vfc_filehistory]
    ADD CONSTRAINT [DF_vfc_filehistory_CheckedOutByUserID] DEFAULT ('0') FOR [CheckedOutByUserID];

