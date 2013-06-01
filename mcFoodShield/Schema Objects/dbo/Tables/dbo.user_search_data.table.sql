CREATE TABLE [dbo].[user_search_data] (
    [id]            INT             IDENTITY (1, 1) NOT NULL,
    [page_URL]      NVARCHAR (250)  NULL,
    [user_ID]       INT             NULL,
    [time_stamp]    DATETIME2 (7)   NULL,
    [site_name]     NVARCHAR (200)  NULL,
    [form_name]     NVARCHAR (100)  NULL,
    [search_params] NVARCHAR (2500) NULL,
    CONSTRAINT [PK_user_search_data] PRIMARY KEY CLUSTERED ([id] ASC)
);




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'the site that the search originate from', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'user_search_data', @level2type = N'COLUMN', @level2name = N'site_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the form on the page that the user is searching from.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'user_search_data', @level2type = N'COLUMN', @level2name = N'form_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'form input name, and the value of that input (example: firstname=larry )', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'user_search_data', @level2type = N'COLUMN', @level2name = N'search_params';

