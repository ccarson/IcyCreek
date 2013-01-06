ALTER TABLE [dbo].[Responses]
    ADD CONSTRAINT [DF_Responses_isEditable] DEFAULT ((1)) FOR [isEditable];

