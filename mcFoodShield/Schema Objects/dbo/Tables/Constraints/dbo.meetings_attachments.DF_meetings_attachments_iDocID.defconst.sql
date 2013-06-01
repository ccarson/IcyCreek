ALTER TABLE [dbo].[meetings_attachments]
    ADD CONSTRAINT [DF_meetings_attachments_iDocID] DEFAULT ('0') FOR [iDocID];

