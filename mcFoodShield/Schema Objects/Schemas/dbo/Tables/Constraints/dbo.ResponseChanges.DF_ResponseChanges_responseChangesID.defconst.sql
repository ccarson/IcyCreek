ALTER TABLE [dbo].[ResponseChanges]
    ADD CONSTRAINT [DF_ResponseChanges_responseChangesID] DEFAULT (newsequentialid()) FOR [responseChangesID];

