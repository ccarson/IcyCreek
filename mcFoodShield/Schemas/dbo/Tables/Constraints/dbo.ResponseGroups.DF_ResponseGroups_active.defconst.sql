ALTER TABLE [dbo].[ResponseGroups]
    ADD CONSTRAINT [DF_ResponseGroups_active] DEFAULT ((1)) FOR [active];

