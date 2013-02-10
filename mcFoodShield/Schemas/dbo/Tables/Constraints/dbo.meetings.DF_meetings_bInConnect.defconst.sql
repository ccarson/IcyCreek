ALTER TABLE [dbo].[meetings]
    ADD CONSTRAINT [DF_meetings_bInConnect] DEFAULT ((0)) FOR [bInConnect];

