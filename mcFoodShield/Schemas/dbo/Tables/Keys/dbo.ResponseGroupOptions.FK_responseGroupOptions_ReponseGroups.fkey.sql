ALTER TABLE [dbo].[ResponseGroupOptions]
    ADD CONSTRAINT [FK_responseGroupOptions_ReponseGroups] FOREIGN KEY ([responseGroupsID]) REFERENCES [dbo].[ResponseGroups] ([responseGroupsID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

