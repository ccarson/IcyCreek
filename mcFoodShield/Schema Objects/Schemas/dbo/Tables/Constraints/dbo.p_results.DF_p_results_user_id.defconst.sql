ALTER TABLE [dbo].[p_results]
    ADD CONSTRAINT [DF_p_results_user_id] DEFAULT (NULL) FOR [user_id];

