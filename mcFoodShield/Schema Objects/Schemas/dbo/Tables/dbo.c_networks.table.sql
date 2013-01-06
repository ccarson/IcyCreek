CREATE TABLE [dbo].[c_networks] (
    [id]           INT          IDENTITY (15, 1) NOT NULL,
    [network_name] VARCHAR (20) NOT NULL,
    [active]       BIT          NOT NULL,
    [custom_id]    INT          NOT NULL
);

