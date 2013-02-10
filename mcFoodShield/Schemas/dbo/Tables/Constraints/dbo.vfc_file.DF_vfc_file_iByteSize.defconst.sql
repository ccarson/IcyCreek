ALTER TABLE [dbo].[vfc_file]
    ADD CONSTRAINT [DF_vfc_file_iByteSize] DEFAULT ('0') FOR [iByteSize];

