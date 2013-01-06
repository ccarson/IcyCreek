ALTER TABLE [dbo].[c_sysmember]
    ADD CONSTRAINT [DF_c_sysmember_bActive] DEFAULT ((1)) FOR [bActive];

