ALTER TABLE [dbo].[vfc_fileace]
    ADD CONSTRAINT [DF_vfc_fileace_privateFile] DEFAULT ((0)) FOR [privateFile];

