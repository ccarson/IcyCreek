﻿ALTER TABLE [dbo].[learn_regquestions]
    ADD CONSTRAINT [DF_learn_regquestions_updatedBy] DEFAULT (NULL) FOR [updatedBy];

