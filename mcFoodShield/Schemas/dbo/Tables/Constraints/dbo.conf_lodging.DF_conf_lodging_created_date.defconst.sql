ALTER TABLE [dbo].[conf_lodging]
    ADD CONSTRAINT [DF_conf_lodging_created_date] DEFAULT (NULL) FOR [created_date];

