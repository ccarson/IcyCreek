ALTER TABLE [dbo].[c_affiliation]
    ADD CONSTRAINT [DF_c_affiliation_datecreated] DEFAULT (getdate()) FOR [datecreated];

