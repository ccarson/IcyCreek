ALTER TABLE [dbo].[ResponseGroupOptions]
    ADD CONSTRAINT [DF_ResponseGroupOptions_responseGroupOptionsID] DEFAULT (newsequentialid()) FOR [responseGroupOptionsID];

