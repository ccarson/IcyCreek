ALTER TABLE [dbo].[Responses]
    ADD CONSTRAINT [DF_Responses_groupID] DEFAULT ((0)) FOR [groupID];

