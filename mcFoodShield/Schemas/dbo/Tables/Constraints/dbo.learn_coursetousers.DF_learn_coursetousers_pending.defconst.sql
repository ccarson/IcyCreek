ALTER TABLE [dbo].[learn_coursetousers]
    ADD CONSTRAINT [DF_learn_coursetousers_pending] DEFAULT ((0)) FOR [pending];

