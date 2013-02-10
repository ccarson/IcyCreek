ALTER TABLE [dbo].[c_timezone]
    ADD CONSTRAINT [DF_c_timezone_iTimeOffset] DEFAULT ('0') FOR [iTimeOffset];

