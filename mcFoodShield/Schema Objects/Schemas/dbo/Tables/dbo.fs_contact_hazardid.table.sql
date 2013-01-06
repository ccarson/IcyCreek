CREATE TABLE [dbo].[fs_contact_hazardid] (
    [id]                 INT            IDENTITY (472, 1) NOT NULL,
    [user_id]            INT            NOT NULL,
    [hazard_id]          INT            NOT NULL,
    [state_jurisdiction] NVARCHAR (150) NULL
);

