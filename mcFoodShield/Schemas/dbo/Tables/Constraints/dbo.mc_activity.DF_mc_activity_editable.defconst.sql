ALTER TABLE [dbo].[mc_activity]
    ADD CONSTRAINT [DF_mc_activity_editable] DEFAULT ((0)) FOR [editable];

