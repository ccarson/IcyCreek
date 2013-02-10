ALTER TABLE [dbo].[conf_lodging]
    ADD CONSTRAINT [DF_conf_lodging_created_by] DEFAULT ('0') FOR [created_by];

