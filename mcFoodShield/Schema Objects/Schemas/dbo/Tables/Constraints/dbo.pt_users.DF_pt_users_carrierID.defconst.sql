ALTER TABLE [dbo].[pt_users]
    ADD CONSTRAINT [DF_pt_users_carrierID] DEFAULT (NULL) FOR [carrierID];

