ALTER TABLE [dbo].[__BuildMaster_DbSchemaChanges]
    ADD CONSTRAINT [__BuildMaster_DbSchemaChangesPK] PRIMARY KEY CLUSTERED ([Numeric_Release_Number] ASC, [Script_Id] ASC, [Script_Sequence] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

