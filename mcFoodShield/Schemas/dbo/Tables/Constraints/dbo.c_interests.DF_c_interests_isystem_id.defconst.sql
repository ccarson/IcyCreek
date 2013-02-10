ALTER TABLE [dbo].[c_interests]
    ADD CONSTRAINT [DF_c_interests_isystem_id] DEFAULT ('0') FOR [isystem_id];

