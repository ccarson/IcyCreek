ALTER TABLE [dbo].[vfc_file]
    ADD CONSTRAINT [DF_vfc_file_allowComments] DEFAULT ((0)) FOR [allowComments];

