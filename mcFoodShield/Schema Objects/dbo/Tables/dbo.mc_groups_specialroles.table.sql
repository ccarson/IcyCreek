CREATE TABLE [dbo].[mc_groups_specialroles] (
    [id]          INT           IDENTITY (20, 1) NOT NULL,
    [Role_Name]   NVARCHAR (30) NOT NULL,
    [bAdmin]      BIT           NOT NULL,
    [bActive]     BIT           NOT NULL,
    [iGroup_ID]   INT           NOT NULL,
    [iSort_Order] INT           NOT NULL,
    [bMembers]    BIT           NOT NULL
);

