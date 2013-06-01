ALTER TABLE [dbo].[s_surveys]
    ADD CONSTRAINT [DF_s_surveys_showinpubliclist] DEFAULT ((0)) FOR [showinpubliclist];

