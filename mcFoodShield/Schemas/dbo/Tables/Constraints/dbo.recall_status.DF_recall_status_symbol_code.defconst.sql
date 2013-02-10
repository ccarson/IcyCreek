ALTER TABLE [dbo].[recall_status]
    ADD CONSTRAINT [DF_recall_status_symbol_code] DEFAULT (NULL) FOR [symbol_code];

