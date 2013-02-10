ALTER TABLE [dbo].[mc_groupnotes]
    ADD CONSTRAINT [DF_mc_groupnotes_icreatedby] DEFAULT ('0') FOR [icreatedby];

