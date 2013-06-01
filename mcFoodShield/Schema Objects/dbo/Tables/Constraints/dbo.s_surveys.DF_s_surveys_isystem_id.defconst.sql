ALTER TABLE [dbo].[s_surveys]
    ADD CONSTRAINT [DF_s_surveys_isystem_id] DEFAULT ('0') FOR [isystem_id];

