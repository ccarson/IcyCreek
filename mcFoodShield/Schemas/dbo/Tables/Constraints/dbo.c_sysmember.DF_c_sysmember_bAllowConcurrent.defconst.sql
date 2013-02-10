ALTER TABLE [dbo].[c_sysmember]
    ADD CONSTRAINT [DF_c_sysmember_bAllowConcurrent] DEFAULT ((0)) FOR [bAllowConcurrent];

