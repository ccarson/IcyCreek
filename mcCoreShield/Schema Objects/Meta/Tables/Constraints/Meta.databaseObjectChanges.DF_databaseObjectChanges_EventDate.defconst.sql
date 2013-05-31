ALTER TABLE [Meta].[databaseObjectChanges]
    ADD CONSTRAINT [DF_databaseObjectChanges_EventDate] DEFAULT (sysdatetime()) FOR [EventDate];

