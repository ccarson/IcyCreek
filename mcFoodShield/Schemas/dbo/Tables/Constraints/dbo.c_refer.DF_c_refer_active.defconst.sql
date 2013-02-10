ALTER TABLE [dbo].[c_refer]
    ADD CONSTRAINT [DF_c_refer_active] DEFAULT ((0)) FOR [active];

