ALTER TABLE [dbo].[vfc_file]
    ADD CONSTRAINT [DF_vfc_file_CreatedByUserID] DEFAULT ('0') FOR [CreatedByUserID];

