ALTER TABLE [dbo].[conf_aphis]
    ADD CONSTRAINT [DF_conf_aphis_sub_dept_id] DEFAULT ('0') FOR [sub_dept_id];

