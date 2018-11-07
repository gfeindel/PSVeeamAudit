function Get-TargetResource {
    param(
        [ValidateNotNullOrEmpty()]
        [string]$JobName,

        [ValidateSet('Present','Absent')]
        [string]$Ensure,

        [ValidateSet('Daily','Weekly','Monthly')]
        [string]$Frequency,

        [ValidateSet('None','DedupeFriendly','Optimal','High','Extreme')]
        [string]$CompressionLevel

        #[ValidatePattern('[a-zA-Z0-9_.+-]+@[a-zA-Z0-9_.+-]\.[a-zA-Z]{2,}')]
        #[string[]]$NotificationRecipients
    )
    
    $job = Get-VbrBackup -JobName $JobName
    $spec = $null
    $repo = $null
    $frequency = $null

    if($null -eq $job) {
        $spec = @{
            JobName = $job.JobName
            $Ensure = "Absent"
        }
    } else {
        $repo = $job.FindTargetRepository()
        if($job.Options.ScheduleOptions.OptionsDaily.Enabled) {
            $frequency = 'Daily'
        } elseif($job.Options.ScheduleOptions.OptionsMonthly.Enabled) {
            $frequency = 'Monthly'
        } elseif($job.Options.ScheduleOptions.OptionsPeriodically.Enabled) {
            $frequency = 'Periodically'
        } elseif($job.Options.ScheduleOptions.OptionsContinuous.Enabled) {
            $frequency = 'Continuous'
        } else {
            $frequency = 'None'
        }
        $spec = @{
            JobName = $job.JobName
            Ensure = 'Present'
            Frequency = $frequency
            BackupRepositoryName = $repo.Name
            BackupMode = ''
            CompressionLevel = ''
            NotificationRecipients = $job.Options.NotificationOptions.EmailNotificationAdditionalAddresses
        }
    }
    $spec
}

function Set-TargetResource {
    param(
        [ValidateNotNullOrEmpty()]
        [string]$JobName,
        
        [ValidateSet('Present','Absent')]
        [string]$Ensure,
        
        [ValidateSet('Daily','Weekly','Monthly')]
        [string]$Frequency,
        
        # [string]$BackupRepositoryName,
        
        # [ValidateSet('Incremental','ReverseIncremental')]
        # [string]$BackupMode,
        
        [ValidateSet('None','DedupeFriendly','Optimal','High','Extreme')]
        [string]$CompressionLevel
        
        # [ValidatePattern('[a-zA-Z0-9_.+-]+@[a-zA-Z0-9_.+-]\.[a-zA-Z]{2,}')]
        # [string[]]$NotificationRecipients
    )

    $true
}

function Test-TargetResource {
    param(
        [ValidateNotNullOrEmpty()]
        [string]$JobName,
        
        [ValidateSet('Present','Absent')]
        [string]$Ensure,
        
        [ValidateSet('Daily','Weekly','Monthly')]
        [string]$Frequency,
        
        # [string]$BackupRepositoryName,
        
        # [ValidateSet('Incremental','ReverseIncremental')]
        # [string]$BackupMode,
        
        [ValidateSet('None','DedupeFriendly','Optimal','High','Extreme')]
        [string]$CompressionLevel
        
        # [ValidatePattern('[a-zA-Z0-9_.+-]+@[a-zA-Z0-9_.+-]\.[a-zA-Z]{2,}')]
        # [string[]]$NotificationRecipients
    )
    $job = Get-TargetResource -JobName $JobName
    if($Ensure -eq 'Present' -and $null -eq $job) {
        return $false
    }
    if($Ensure -eq 'Absent' -and $null -ne $job) {
        return $false
    }
    $true
}