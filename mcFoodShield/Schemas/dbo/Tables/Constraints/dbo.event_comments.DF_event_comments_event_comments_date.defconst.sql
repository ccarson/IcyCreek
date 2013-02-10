ALTER TABLE [dbo].[event_comments]
    ADD CONSTRAINT [DF_event_comments_event_comments_date] DEFAULT (NULL) FOR [event_comments_date];

