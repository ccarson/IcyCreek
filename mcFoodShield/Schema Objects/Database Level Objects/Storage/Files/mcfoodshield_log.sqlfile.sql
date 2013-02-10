ALTER DATABASE [$(DatabaseName)]
    ADD LOG FILE (NAME = [mcfoodshield_log], FILENAME = '$(DefaultLogPath)$(DatabaseName)_log.ldf', FILEGROWTH = 10 %);

