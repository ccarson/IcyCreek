ALTER TABLE [dbo].[Requests]
    ADD CONSTRAINT [DF_Requests_requestsID] DEFAULT (newsequentialid()) FOR [requestsID];

