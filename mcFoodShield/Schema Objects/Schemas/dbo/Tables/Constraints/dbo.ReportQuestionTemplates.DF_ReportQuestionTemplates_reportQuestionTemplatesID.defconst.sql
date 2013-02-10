ALTER TABLE [dbo].[ReportQuestionTemplates]
    ADD CONSTRAINT [DF_ReportQuestionTemplates_reportQuestionTemplatesID] DEFAULT (newsequentialid()) FOR [reportQuestionTemplatesID];

