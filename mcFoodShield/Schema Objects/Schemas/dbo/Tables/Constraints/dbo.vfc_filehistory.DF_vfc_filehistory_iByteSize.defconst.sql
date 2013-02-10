ALTER TABLE [dbo].[vfc_filehistory]
    ADD CONSTRAINT [DF_vfc_filehistory_iByteSize] DEFAULT ('0') FOR [iByteSize];

