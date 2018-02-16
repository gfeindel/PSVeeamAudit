function Get-TargetResource {
[ValidateNotNullOrEmpty()]
[string]$JobName,

[ValidateSet('Present','Absent')]
[string]$Ensure,

[ValidateSet('Daily','Weekly','Monthly')]
[string]$Frequency,

[string]$BackupRepositoryName,

[ValidateSet('Incremental','ReverseIncremental')]
[string]$BackupMode,

[ValidateSet('None','DedupeFriendly','Optimal','High','Extreme')]
[string]$CompressionLevel,

[ValidatePattern('[a-zA-Z0-9_.+-]+@[a-zA-Z0-9_.+-]\.[a-zA-Z]{2,}')]
[string[]]$NotificationRecipients

}

function Set-TargetResource {
    [ValidateNotNullOrEmpty()]
    [string]$JobName,
    
    [ValidateSet('Present','Absent')]
    [string]$Ensure,
    
    [ValidateSet('Daily','Weekly','Monthly')]
    [string]$Frequency,
    
    [string]$BackupRepositoryName,
    
    [ValidateSet('Incremental','ReverseIncremental')]
    [string]$BackupMode,
    
    [ValidateSet('None','DedupeFriendly','Optimal','High','Extreme')]
    [string]$CompressionLevel,
    
    [ValidatePattern('[a-zA-Z0-9_.+-]+@[a-zA-Z0-9_.+-]\.[a-zA-Z]{2,}')]
    [string[]]$NotificationRecipients
    
}

function Test-TargetResource {
    [ValidateNotNullOrEmpty()]
    [string]$JobName,
    
    [ValidateSet('Present','Absent')]
    [string]$Ensure,
    
    [ValidateSet('Daily','Weekly','Monthly')]
    [string]$Frequency,
    
    [string]$BackupRepositoryName,
    
    [ValidateSet('Incremental','ReverseIncremental')]
    [string]$BackupMode,
    
    [ValidateSet('None','DedupeFriendly','Optimal','High','Extreme')]
    [string]$CompressionLevel,
    
    [ValidatePattern('[a-zA-Z0-9_.+-]+@[a-zA-Z0-9_.+-]\.[a-zA-Z]{2,}')]
    [string[]]$NotificationRecipients
    
}