ALTER TABLE [dbo].[methods]
    ADD CONSTRAINT [DF_methods_methodTypeID] DEFAULT ((1)) FOR [methodTypeID];

