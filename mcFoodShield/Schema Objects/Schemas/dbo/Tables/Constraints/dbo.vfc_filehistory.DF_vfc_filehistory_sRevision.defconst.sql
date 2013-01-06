ALTER TABLE [dbo].[vfc_filehistory]
    ADD CONSTRAINT [DF_vfc_filehistory_sRevision] DEFAULT ('0') FOR [sRevision];

