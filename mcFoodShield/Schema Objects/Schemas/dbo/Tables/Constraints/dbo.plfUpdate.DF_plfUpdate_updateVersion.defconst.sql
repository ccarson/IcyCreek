ALTER TABLE [dbo].[plfUpdate]
    ADD CONSTRAINT [DF_plfUpdate_updateVersion] DEFAULT ('0') FOR [updateVersion];

