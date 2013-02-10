ALTER TABLE [dbo].[s_results]
    ADD CONSTRAINT [DF_s_results_truefalse] DEFAULT ((0)) FOR [truefalse];

