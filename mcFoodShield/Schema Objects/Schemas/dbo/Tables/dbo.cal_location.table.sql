CREATE TABLE [dbo].[cal_location] (
    [LocationID]   INT            IDENTITY (1, 1) NOT NULL,
    [LocationName] NVARCHAR (50)  NULL,
    [Address1]     NVARCHAR (155) NULL,
    [Address2]     NVARCHAR (155) NULL,
    [City]         NVARCHAR (155) NULL,
    [Zip]          NVARCHAR (10)  NULL,
    [State]        NVARCHAR (50)  NULL,
    [Inactive]     BIT            NOT NULL
);

