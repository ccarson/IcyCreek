ALTER TABLE [dbo].[vfc_filehistory]
    ADD CONSTRAINT [DF_vfc_filehistory_dtCheckedOut] DEFAULT (NULL) FOR [dtCheckedOut];

