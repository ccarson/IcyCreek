ALTER TABLE [dbo].[c_notes]
    ADD CONSTRAINT [DF_c_notes_active] DEFAULT ((0)) FOR [active];

