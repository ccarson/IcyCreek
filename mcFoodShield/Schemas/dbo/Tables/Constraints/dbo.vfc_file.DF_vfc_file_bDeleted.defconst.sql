ALTER TABLE [dbo].[vfc_file]
    ADD CONSTRAINT [DF_vfc_file_bDeleted] DEFAULT ((0)) FOR [bDeleted];

