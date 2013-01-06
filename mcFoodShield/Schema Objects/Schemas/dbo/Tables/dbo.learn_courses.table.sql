CREATE TABLE [dbo].[learn_courses] (
    [courseID]          NVARCHAR (35)  NOT NULL,
    [courseName]        NVARCHAR (250) NOT NULL,
    [courseDescription] NVARCHAR (250) NOT NULL,
    [createdOn]         DATETIME2 (0)  NOT NULL,
    [createdBy]         NVARCHAR (35)  NOT NULL,
    [startDate]         DATETIME2 (0)  NULL,
    [endDate]           DATETIME2 (0)  NULL,
    [regStartDate]      DATETIME2 (0)  NULL,
    [regEndDate]        DATETIME2 (0)  NULL
);

