ALTER TABLE [dbo].[conf_aphis]
    ADD CONSTRAINT [DF_conf_aphis_org_id] DEFAULT ('0') FOR [org_id];

