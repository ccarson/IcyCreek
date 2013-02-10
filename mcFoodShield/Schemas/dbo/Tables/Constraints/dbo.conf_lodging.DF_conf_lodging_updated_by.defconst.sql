ALTER TABLE [dbo].[conf_lodging]
    ADD CONSTRAINT [DF_conf_lodging_updated_by] DEFAULT ('0') FOR [updated_by];

