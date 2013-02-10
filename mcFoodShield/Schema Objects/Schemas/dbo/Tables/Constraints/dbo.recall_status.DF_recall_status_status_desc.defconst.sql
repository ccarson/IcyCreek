ALTER TABLE [dbo].[recall_status]
    ADD CONSTRAINT [DF_recall_status_status_desc] DEFAULT (NULL) FOR [status_desc];

