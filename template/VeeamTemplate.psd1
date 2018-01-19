<#
   Describes Veeam Job templates
   To load this in a PS script, use Import-LocalizedData

   Todo: Document API equivalent for each setting. See BackupMode for example.
#>

@{
    "WeeklyFull" = @{
        ####################################################
        # Job Settings
        ####################################################

        # Regex describing the format of the job name.
        JobNameFormatRegex = "[A-Z0-9]{3} (Weekly|Nightly)"
        
        # Frequency of job execution. Must be Daily, Weekly, Periodically, Continous
        JobFrequency = "Weekly"
        JobDays = ""
        JobStartTime = "10:00 PM"
        MinRestorePoints = 14

        ####################################################
        # Backup settings
        ####################################################

        # Name of the repository to use.
        # Value: Name of backup proxy as returned by Get-VbrBackupRepository
        BackupRepositoryName = ""
        
        # Backup mode must be ReverseIncremental or Incremental.
        # Value: Incremental|ReverseIncremental
        # API: BackupTargetOptions.Algorithm
        BackupMode = ""

        # Veeam option: \Backup\Create synthetic fulls periodically
        # Value: Yes|No
        # API: BackupTargetOptions.TransformFullToSynthetic
        CreateSyntheticFull = ""

        # Veeam option: \Backup\Synthetic full days
        # Value: Everyday or list of weekdays
        # Required if CreateSyntheticFull=Yes
        # API: BackupTargetOptions.TransformToSyntethicDays (misspelling is in API)
        SyntheticFullDays = [DayOfWeek]@("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")
        
        # List of proxies that the job should use. If no affinity,
        # set to $null or empty array.
        # Value: array of 0 or more proxy names as returned by Get-VbrViProxy
        ProxyAffinity = @()

        ####################################################
        # Storage settings
        ####################################################

        # Veeam setting: \Storage\Compression level
        # Values: None|DedupeFriendly|Optimal|High|Extreme
        CompressionLevel = ""

        # Veeam setting: \Storage\Storage optimization
        # Values: Local16TB|Local|LAN|WAN
        StorageOptimization = ""

        ####################################################
        # Notification Settings
        ####################################################
        
        # Veeam setting: \Notification\Send notifications to:
        # Value: comma-separated list of e-mail addresses. If this is non-empty, it implies 
        # the option to send notifications should be checked. If empty, implies
        # that option should not be checked.
        NotificationRecipients = ""
    }
}