CREATE TABLE [dbo].[fs_contact_progids] (
    [id]            INT IDENTITY (620, 1) NOT NULL,
    [user_id]       INT NULL,
    [OLD_prog_id]   INT NULL,
    [prog_id]       INT NULL,
    [OLD_agency_id] INT NULL,
    [agency_id]     INT NULL,
    [active]        BIT NOT NULL
);

