ALTER TABLE [dbo].[c_groupcores]
    ADD CONSTRAINT [DF_c_groupcores_admin] DEFAULT ((0)) FOR [admin];

