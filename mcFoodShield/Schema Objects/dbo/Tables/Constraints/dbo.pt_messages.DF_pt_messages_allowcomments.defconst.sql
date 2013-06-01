ALTER TABLE [dbo].[pt_messages]
    ADD CONSTRAINT [DF_pt_messages_allowcomments] DEFAULT (NULL) FOR [allowcomments];

