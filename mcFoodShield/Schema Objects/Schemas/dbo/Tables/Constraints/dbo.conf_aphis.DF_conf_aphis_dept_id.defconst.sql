ALTER TABLE [dbo].[conf_aphis]
    ADD CONSTRAINT [DF_conf_aphis_dept_id] DEFAULT ('0') FOR [dept_id];

