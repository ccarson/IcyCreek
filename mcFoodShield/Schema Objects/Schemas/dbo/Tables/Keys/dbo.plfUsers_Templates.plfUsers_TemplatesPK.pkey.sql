﻿ALTER TABLE [dbo].[plfUsers_Templates]
    ADD CONSTRAINT [plfUsers_TemplatesPK] PRIMARY KEY CLUSTERED ([userId_templateId] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

