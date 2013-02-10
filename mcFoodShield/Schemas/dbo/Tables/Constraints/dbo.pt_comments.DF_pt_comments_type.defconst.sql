ALTER TABLE [dbo].[pt_comments]
    ADD CONSTRAINT [DF_pt_comments_type] DEFAULT (NULL) FOR [type];

