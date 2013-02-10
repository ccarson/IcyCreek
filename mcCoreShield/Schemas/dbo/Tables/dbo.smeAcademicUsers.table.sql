CREATE TABLE [dbo].[smeAcademicUsers] (
    [degree_id]      INT              DEFAULT ((0)) NOT NULL,
    [specialty_id]   INT              DEFAULT ((0)) NOT NULL,
    [university_id]  INT              DEFAULT ((0)) NOT NULL,
    [degree_type_id] INT              DEFAULT ((0)) NOT NULL,
    [bactive]        BIT              DEFAULT ((0)) NOT NULL,
    [major_id]       INT              DEFAULT ((0)) NOT NULL,
    [user_id]        UNIQUEIDENTIFIER NULL,
    [createdBy]      UNIQUEIDENTIFIER NULL,
    [id]             INT              IDENTITY (1, 1) NOT NULL,
    [dtCreated]      DATETIME         NULL
);

