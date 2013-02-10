ALTER TABLE [dbo].[vfc_file]
    ADD CONSTRAINT [DF_vfc_file_MIMETypeID] DEFAULT ('0') FOR [MIMETypeID];

