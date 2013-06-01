ALTER TABLE [dbo].[Responses]
    ADD CONSTRAINT [DF_Responses_responsesID] DEFAULT (newsequentialid()) FOR [responsesID];

