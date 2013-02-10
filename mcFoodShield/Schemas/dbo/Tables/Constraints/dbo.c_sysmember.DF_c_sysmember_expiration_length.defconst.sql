ALTER TABLE [dbo].[c_sysmember]
    ADD CONSTRAINT [DF_c_sysmember_expiration_length] DEFAULT ('0') FOR [expiration_length];

