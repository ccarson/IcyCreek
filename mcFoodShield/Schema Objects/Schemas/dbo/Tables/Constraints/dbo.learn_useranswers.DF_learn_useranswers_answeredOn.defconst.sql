﻿ALTER TABLE [dbo].[learn_useranswers]
    ADD CONSTRAINT [DF_learn_useranswers_answeredOn] DEFAULT (getdate()) FOR [answeredOn];

