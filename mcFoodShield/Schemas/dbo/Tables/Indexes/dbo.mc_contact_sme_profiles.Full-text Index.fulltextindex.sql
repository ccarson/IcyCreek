CREATE FULLTEXT INDEX ON [dbo].[mc_contact_sme_profiles]
    ([areasOfExpertise] LANGUAGE 1033, [discipline] LANGUAGE 1033, [experience] LANGUAGE 1033, [methodologiesTools] LANGUAGE 1033)
    KEY INDEX [PK_mc_contact_sme_profiles]
    ON [SMEprofilesFTC];

