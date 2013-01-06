CREATE TABLE [dbo].[mc_contact_sme_topics] (
    [id]                   INT IDENTITY (1, 1) NOT NULL,
    [smeExpertsID]         INT NOT NULL,
    [smeTopicsID]          INT NOT NULL,
    [cLevelOfExpertiseID]  INT NOT NULL,
    [canConsultGovernment] BIT NOT NULL,
    [canConsultIndustry]   BIT NOT NULL,
    [canConsultMedia]      BIT NOT NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'cross-reference showing experts related to topics.  An experts'' level of expertise is captured, along with whether or not an expert is willing/able to consult with different groups on the topic.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mc_contact_sme_topics';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'unique identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mc_contact_sme_topics', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'( FK ) id of the smeExpert having the knowledge', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mc_contact_sme_topics', @level2type = N'COLUMN', @level2name = N'smeExpertsID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'( FK ) id of the topic involved', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mc_contact_sme_topics', @level2type = N'COLUMN', @level2name = N'smeTopicsID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'( FK ) of the experts level of knowledge', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mc_contact_sme_topics', @level2type = N'COLUMN', @level2name = N'cLevelOfExpertiseID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Available to consult to government and agencies on subject', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mc_contact_sme_topics', @level2type = N'COLUMN', @level2name = N'canConsultGovernment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Available to consult to industry on subject', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mc_contact_sme_topics', @level2type = N'COLUMN', @level2name = N'canConsultIndustry';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Available to consult to media on subject', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mc_contact_sme_topics', @level2type = N'COLUMN', @level2name = N'canConsultMedia';

