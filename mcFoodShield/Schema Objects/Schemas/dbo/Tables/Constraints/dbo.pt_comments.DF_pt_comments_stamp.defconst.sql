ALTER TABLE [dbo].[pt_comments]
    ADD CONSTRAINT [DF_pt_comments_stamp] DEFAULT (NULL) FOR [stamp];

