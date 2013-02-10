ALTER TABLE [dbo].[mtsch_opt_outs]
    ADD CONSTRAINT [DF_mtsch_opt_outs_opt_out_name] DEFAULT (NULL) FOR [opt_out_name];

