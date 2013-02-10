ALTER TABLE [dbo].[vfc_filehistory]
    ADD CONSTRAINT [DF_vfc_filehistory_MIMETypeID] DEFAULT ('0') FOR [MIMETypeID];

