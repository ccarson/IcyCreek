CREATE TABLE [dbo].[OrgDepartmentLab] (
    [id]              UNIQUEIDENTIFIER NOT NULL,
    [fernActive]      BIT              NULL,
    [micro]           BIT              NULL,
    [chem]            BIT              NULL,
    [rad]             BIT              NULL,
    [isSearchable]    BIT              DEFAULT ((1)) NULL,
    [microAcceptedOn] DATETIME2 (7)    NULL,
    [microWithdrawOn] DATETIME2 (7)    NULL,
    [chemAcceptedOn]  DATETIME2 (7)    NULL,
    [chemWithdrawOn]  DATETIME2 (7)    NULL,
    [radAcceptedOn]   DATETIME2 (7)    NULL,
    [radWithdrawOn]   DATETIME2 (7)    NULL
);

