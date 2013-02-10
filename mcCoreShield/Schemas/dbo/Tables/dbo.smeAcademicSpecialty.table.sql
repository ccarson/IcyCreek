CREATE TABLE [dbo].[smeAcademicSpecialty] (
    [id]             INT            IDENTITY (1, 1) NOT NULL,
    [specialty_name] NVARCHAR (255) NULL,
    [major_id]       INT            DEFAULT ((0)) NOT NULL
);

