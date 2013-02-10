ALTER DATABASE [$(DatabaseName)]
    ADD FILE (NAME = [mcfoodshield], FILENAME = '$(DefaultDataPath)$(DatabaseName).mdf', FILEGROWTH = 1024 KB) TO FILEGROUP [PRIMARY];

