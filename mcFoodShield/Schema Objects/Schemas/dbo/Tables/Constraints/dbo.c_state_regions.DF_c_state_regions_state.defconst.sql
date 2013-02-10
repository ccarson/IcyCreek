ALTER TABLE [dbo].[c_state_regions]
    ADD CONSTRAINT [DF_c_state_regions_state] DEFAULT (N'') FOR [state];

