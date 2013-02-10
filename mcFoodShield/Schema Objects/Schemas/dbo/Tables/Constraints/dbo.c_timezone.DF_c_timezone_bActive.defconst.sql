ALTER TABLE [dbo].[c_timezone]
    ADD CONSTRAINT [DF_c_timezone_bActive] DEFAULT ((1)) FOR [bActive];

