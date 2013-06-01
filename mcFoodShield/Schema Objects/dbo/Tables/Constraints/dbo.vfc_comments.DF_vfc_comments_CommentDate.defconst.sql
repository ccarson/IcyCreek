ALTER TABLE [dbo].[vfc_comments]
    ADD CONSTRAINT [DF_vfc_comments_CommentDate] DEFAULT (NULL) FOR [CommentDate];

