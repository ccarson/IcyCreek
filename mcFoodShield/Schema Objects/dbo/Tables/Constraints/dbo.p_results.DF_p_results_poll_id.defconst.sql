ALTER TABLE [dbo].[p_results]
    ADD CONSTRAINT [DF_p_results_poll_id] DEFAULT ('0') FOR [poll_id];

