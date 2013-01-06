ALTER TABLE [dbo].[vfc_filehistory]
    ADD CONSTRAINT [DF_vfc_filehistory_iMinorRevision] DEFAULT ('0') FOR [iMinorRevision];

