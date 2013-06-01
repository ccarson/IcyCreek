ALTER TABLE [dbo].[recall_status]
    ADD CONSTRAINT [DF_recall_status_symbol_color] DEFAULT (NULL) FOR [symbol_color];

