ALTER TABLE [dbo].[vfc_filehistory]
    ADD CONSTRAINT [DF_vfc_filehistory_pChange] DEFAULT ('0') FOR [pChange];

