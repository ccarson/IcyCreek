ALTER TABLE [dbo].[p_polls]
    ADD CONSTRAINT [DF_p_polls_filename] DEFAULT (NULL) FOR [filename];

