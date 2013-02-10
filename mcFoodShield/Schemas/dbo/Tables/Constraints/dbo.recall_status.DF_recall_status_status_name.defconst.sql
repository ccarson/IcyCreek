ALTER TABLE [dbo].[recall_status]
    ADD CONSTRAINT [DF_recall_status_status_name] DEFAULT (NULL) FOR [status_name];

