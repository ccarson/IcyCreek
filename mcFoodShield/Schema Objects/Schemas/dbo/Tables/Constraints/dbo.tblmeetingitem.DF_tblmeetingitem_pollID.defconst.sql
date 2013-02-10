ALTER TABLE [dbo].[tblmeetingitem]
    ADD CONSTRAINT [DF_tblmeetingitem_pollID] DEFAULT ((0)) FOR [pollID];

