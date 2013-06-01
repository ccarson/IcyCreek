ALTER TABLE [dbo].[savvy_tables]
    ADD CONSTRAINT [DF_savvy_tables_sSortColumn] DEFAULT (N'(''Name'')') FOR [sSortColumn];

