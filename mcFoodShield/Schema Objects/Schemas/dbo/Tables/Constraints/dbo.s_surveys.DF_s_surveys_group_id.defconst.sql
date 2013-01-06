ALTER TABLE [dbo].[s_surveys]
    ADD CONSTRAINT [DF_s_surveys_group_id] DEFAULT ('0') FOR [group_id];

