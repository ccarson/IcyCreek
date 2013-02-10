ALTER TABLE [dbo].[p_polls]
    ADD CONSTRAINT [DF_p_polls_registered] DEFAULT ((0)) FOR [registered];

