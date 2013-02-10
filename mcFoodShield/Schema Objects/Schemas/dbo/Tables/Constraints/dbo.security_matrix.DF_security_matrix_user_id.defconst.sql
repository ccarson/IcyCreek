ALTER TABLE [dbo].[security_matrix]
    ADD CONSTRAINT [DF_security_matrix_user_id] DEFAULT ('0') FOR [user_id];

