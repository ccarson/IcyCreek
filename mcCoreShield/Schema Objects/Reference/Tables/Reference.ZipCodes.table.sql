﻿CREATE TABLE Reference.ZipCodes (
    id                          INT             NOT NULL    CONSTRAINT PK_ZipCodes PRIMARY KEY CLUSTERED 
  , ZipCode                     NVARCHAR (5)    NULL
  , PrimaryRecord               NVARCHAR (2)    NULL
  , Population                  INT             NULL
  , HouseholdsPerZipcode        DECIMAL (18, 8) NULL
  , WhitePopulation             INT             NULL
  , BlackPopulation             INT             NULL
  , HispanicPopulation          INT             NULL
  , AsianPopulation             INT             NULL
  , HawaiianPopulation          INT             NULL
  , IndianPopulation            INT             NULL
  , OtherPopulation             INT             NULL
  , MalePopulation              INT             NULL
  , FemalePopulation            INT             NULL
  , PersonsPerHousehold         DECIMAL (18, 2) NULL
  , AverageHouseValue           DECIMAL (18, 8) NULL
  , IncomePerHousehold          DECIMAL (18, 8) NULL
  , MedianAge                   DECIMAL (3, 1)  NULL
  , MedianAgeMale               DECIMAL (3, 1)  NULL
  , MedianAgeFemale             DECIMAL (3, 1)  NULL
  , Latitude                    DECIMAL (18, 6) NULL
  , Longitude                   DECIMAL (18, 6) NULL
  , Elevation                   INT             NULL
  , State                       NVARCHAR (2)    NULL
  , StateFullName               NVARCHAR (35)   NULL
  , CityType                    NVARCHAR (1)    NULL
  , CityAliasAbbreviation       NVARCHAR (13)   NULL
  , AreaCode                    NVARCHAR (55)   NULL
  , City                        NVARCHAR (35)   NULL
  , CityAliasName               NVARCHAR (35)   NULL
  , County                      NVARCHAR (45)   NULL
  , CountyFIPS                  NVARCHAR (5)    NULL
  , StateFIPS                   NVARCHAR (2)    NULL
  , TimeZone                    NVARCHAR (2)    NULL
  , DayLightSaving              NVARCHAR (1)    NULL
  , MSA                         NVARCHAR (50)   NULL
  , PMSA                        NVARCHAR (50)   NULL
  , CSA                         NVARCHAR (50)   NULL
  , CBSA                        NVARCHAR (50)   NULL
  , CBSA_DIV                    NVARCHAR (255)  NULL
  , CBSA_Type                   NVARCHAR (50)   NULL
  , CBSA_Name                   NVARCHAR (150)  NULL
  , MSA_Name                    NVARCHAR (150)  NULL
  , PMSA_Name                   NVARCHAR (150)  NULL
  , Region                      NVARCHAR (10)   NULL
  , Division                    NVARCHAR (20)   NULL
  , MailingName                 NVARCHAR (1)    NULL
  , NumberOfBusinesses          INT             NULL
  , NumberOfEmployees           INT             NULL
  , BusinessFirstQuarterPayroll INT             NULL
  , BusinessAnnualPayroll       INT             NULL
  , BusinessEmploymentFlag      NVARCHAR (50)   NULL
  , GrowthRank                  INT             NULL
  , GrowthHousingUnits2003      INT             NULL
  , GrowthHousingUnits2004      INT             NULL
  , GrowthIncreaseNumber        INT             NULL
  , GrowthIncreasePercentage    DECIMAL (18, 2) NULL
  , CBSAPop2003                 INT             NULL
  , CBSADivPop2003              INT             NULL
  , CongressionalDistrict       NVARCHAR (50)   NULL
  , CongressionalLandArea       NVARCHAR (255)  NULL
  , DeliveryResidential         INT             NULL
  , DeliveryBusiness            INT             NULL
  , DeliveryTotal               INT             NULL
  , PreferredLastLineKey        NVARCHAR (25)   NULL
  , ClassificationCode          NVARCHAR (2)    NULL
  , MultiCounty                 NVARCHAR (1)    NULL
  , CSAName                     NVARCHAR (255)  NULL
  , CBSA_Div_Name               NVARCHAR (255)  NULL
  , CityStateKey                NVARCHAR (6)    NULL
  , PopulationEstimate          INT             NULL
  , LandArea                    DECIMAL (12, 6) NULL
  , WaterArea                   DECIMAL (12, 6) NULL
  , CityAliasCode               NVARCHAR (5)    NULL
  , CityMixedCase               NVARCHAR (50)   NULL
  , CityAliasMixedCase          NVARCHAR (50)   NULL
  , BoxCount                    INT             NULL
  , SFDU                        INT             NULL
  , MFDU                        INT             NULL
  , StateANSI                   NVARCHAR (2)    NULL
  , CountyANSI                  NVARCHAR (3)    NULL
  , ZIPIntroDate                NVARCHAR (15)   NULL
  , AliasIntroDate              NVARCHAR (15)   NULL
  , FacilityCode                NVARCHAR (1)    NULL
  , UniqueZIPName               NVARCHAR (1)    NULL
  , CityDeliveryIndicator       NVARCHAR (1)    NULL
  , CarrierRouteRateSortation   NVARCHAR (1)    NULL
  , FinanceNumber               NVARCHAR (6)    NULL
) ;
