ALTER TABLE [dbo].[vfc_filehistory]
    ADD CONSTRAINT [DF_vfc_filehistory_dtCheckedIn] DEFAULT (NULL) FOR [dtCheckedIn];

