ALTER TABLE [dbo].[c_updates]
    ADD CONSTRAINT [DF_c_updates_bActive] DEFAULT ((0)) FOR [bActive];

