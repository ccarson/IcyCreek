ALTER TABLE [dbo].[RequestOptions]
    ADD CONSTRAINT [DF_RequestOptions_requestOptionsID] DEFAULT (newsequentialid()) FOR [requestOptionsID];

