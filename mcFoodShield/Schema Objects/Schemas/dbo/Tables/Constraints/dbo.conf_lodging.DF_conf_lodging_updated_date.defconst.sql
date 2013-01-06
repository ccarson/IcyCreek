ALTER TABLE [dbo].[conf_lodging]
    ADD CONSTRAINT [DF_conf_lodging_updated_date] DEFAULT (NULL) FOR [updated_date];

