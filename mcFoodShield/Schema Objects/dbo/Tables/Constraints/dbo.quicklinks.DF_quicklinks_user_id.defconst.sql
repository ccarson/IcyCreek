ALTER TABLE [dbo].[quicklinks]
    ADD CONSTRAINT [DF_quicklinks_user_id] DEFAULT ((0)) FOR [user_id];

