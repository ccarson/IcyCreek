CREATE TABLE [dbo].[mc_org_department_addresses] (
    [id]       INT            IDENTITY (1, 1) NOT NULL,
    [name]     NVARCHAR (50)  NOT NULL,
    [dept_id]  INT            NOT NULL,
    [address1] NVARCHAR (200) NULL,
    [address2] NVARCHAR (200) NULL,
    [address3] NVARCHAR (200) NULL,
    [city]     NVARCHAR (50)  NULL,
    [state]    NVARCHAR (50)  NULL,
    [zip]      NVARCHAR (10)  NULL,
    [country]  NVARCHAR (50)  NULL,
    [active]   BIT            NOT NULL
);

