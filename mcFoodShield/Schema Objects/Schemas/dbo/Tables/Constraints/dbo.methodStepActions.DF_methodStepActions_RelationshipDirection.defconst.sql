ALTER TABLE [dbo].[methodStepActions]
    ADD CONSTRAINT [DF_methodStepActions_RelationshipDirection] DEFAULT ('OneWay') FOR [RelationshipDirection];

