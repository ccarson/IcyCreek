CREATE TABLE [dbo].[fs_contact_labids] (
    [id]            INT IDENTITY (1098, 1) NOT NULL,
    [user_id]       INT NOT NULL,
    [OLD_labid]     INT NULL,
    [labid]         INT NULL,
    [OLD_agency_id] INT NULL,
    [agency_id]     INT NULL,
    [Active]        BIT NOT NULL
);

