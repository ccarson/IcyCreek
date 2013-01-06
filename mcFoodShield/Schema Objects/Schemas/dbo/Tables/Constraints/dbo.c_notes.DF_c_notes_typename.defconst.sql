ALTER TABLE [dbo].[c_notes]
    ADD CONSTRAINT [DF_c_notes_typename] DEFAULT (N'') FOR [typename];

