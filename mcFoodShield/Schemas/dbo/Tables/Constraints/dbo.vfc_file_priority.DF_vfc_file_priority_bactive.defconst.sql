ALTER TABLE [dbo].[vfc_file_priority]
    ADD CONSTRAINT [DF_vfc_file_priority_bactive] DEFAULT ((1)) FOR [bactive];

