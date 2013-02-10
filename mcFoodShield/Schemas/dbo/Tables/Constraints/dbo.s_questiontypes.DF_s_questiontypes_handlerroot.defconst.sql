ALTER TABLE [dbo].[s_questiontypes]
    ADD CONSTRAINT [DF_s_questiontypes_handlerroot] DEFAULT (N'') FOR [handlerroot];

