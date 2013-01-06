ALTER TABLE [dbo].[s_questiontypes]
    ADD CONSTRAINT [DF_s_questiontypes_name] DEFAULT (N'') FOR [name];

