ALTER TABLE [dbo].[vfc_file]
    ADD CONSTRAINT [DF_vfc_file_sCheckOutComments] DEFAULT (NULL) FOR [sCheckOutComments];

