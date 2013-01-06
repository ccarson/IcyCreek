ALTER TABLE [dbo].[vfc_file]
    ADD CONSTRAINT [DF_vfc_file_iMinorRevision] DEFAULT ('0') FOR [iMinorRevision];

