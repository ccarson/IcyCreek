﻿ALTER TABLE [dbo].[learn_reganswers]
    ADD CONSTRAINT [DF_learn_reganswers_updatedBy] DEFAULT (NULL) FOR [updatedBy];

