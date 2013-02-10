CREATE TABLE [dbo].[mc_contact_addresses_cats] (
    [id]          INT IDENTITY (1, 1) NOT NULL,
    [iaddress_id] INT NOT NULL,
    [iaddtype_id] INT NOT NULL,
    [bActive]     BIT NOT NULL
);

