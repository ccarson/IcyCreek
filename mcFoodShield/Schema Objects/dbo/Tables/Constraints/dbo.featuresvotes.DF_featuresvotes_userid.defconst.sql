ALTER TABLE [dbo].[featuresvotes]
    ADD CONSTRAINT [DF_featuresvotes_userid] DEFAULT ('0') FOR [userid];

