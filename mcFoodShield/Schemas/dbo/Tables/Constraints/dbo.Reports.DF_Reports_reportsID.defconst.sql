ALTER TABLE [dbo].[Reports]
    ADD CONSTRAINT [DF_Reports_reportsID] DEFAULT (newsequentialid()) FOR [reportsID];

