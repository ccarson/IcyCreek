ALTER TABLE [dbo].[mc_reactivate]
    ADD CONSTRAINT [DF_mc_reactivate_password_reset] DEFAULT ((0)) FOR [password_reset];

