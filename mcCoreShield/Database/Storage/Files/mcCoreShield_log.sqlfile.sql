ALTER DATABASE [$(DatabaseName)]
    ADD LOG FILE (NAME = [mcCoreShield_log], FILENAME = '$(DefaultLogPath)$(DatabaseName)_log.ldf', FILEGROWTH = 10 %);

