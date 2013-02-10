ALTER TABLE [dbo].[c_refer]
    ADD CONSTRAINT [DF_c_refer_isystem_id] DEFAULT ('0') FOR [isystem_id];

