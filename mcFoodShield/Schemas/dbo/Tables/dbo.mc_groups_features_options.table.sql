CREATE TABLE [dbo].[mc_groups_features_options] (
    [id]        INT IDENTITY (1, 1) NOT NULL,
    [group_id]  INT NOT NULL,
    [app_id]    INT NOT NULL,
    [option_id] INT NOT NULL,
    [isActive]  BIT NOT NULL
);

