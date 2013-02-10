ALTER TABLE [dbo].[learn_coursetousers]
    ADD CONSTRAINT [DF_learn_coursetousers_accepted] DEFAULT ((0)) FOR [accepted];

