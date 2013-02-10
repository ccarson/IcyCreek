ALTER TABLE [dbo].[conf_aphis]
    ADD CONSTRAINT [DF_conf_aphis_user_id] DEFAULT ('0') FOR [user_id];

