# VeeamDsc

VeeamDsc is a DSC resource to manage the configuration of Veeam Backup and Replication. Resources must run on the Veeam management server, because they require the Veeam Powershell snap-in.

This project has adopted [this code of conduct](CODE_OF_CONDUCT.md).

## Branches

### master

[![Build status](https://ci.appveyor.com/api/projects/status/7le6t5s8g902iad0ykhy/branch/master?svg=true)](https://ci.appveyor.com/project/gfeindel/VeeamDsc/branch/master)
[![codecov](https://codecov.io/gh/gfeindel/VeeamDsc/branch/master/graph/badge.svg)](https://codecov.io/gh/gfeindel/VeeamDsc/branch/master)

This is the branch containing the latest release -
no contributions should be made directly to this branch.

### dev

[![Build status](https://ci.appveyor.com/api/projects/status/7le6t5s8g902iad0ykhy/branch/dev?svg=true)](https://ci.appveyor.com/project/gfeindel/VeeamDsc/branch/dev)
[![codecov](https://codecov.io/gh/gfeindel/VeeamDsc/branch/dev/graph/badge.svg)](https://codecov.io/gh/gfeindel/VeeamDsc/branch/dev)

This is the development branch
to which contributions should be proposed by contributors as pull requests.
This development branch will periodically be merged to the master branch,
and be released to [PowerShell Gallery](https://www.powershellgallery.com/).

## How to Contribute

If you would like to contribute to this repository, please read the DSC Resource Kit [contributing guidelines](https://github.com/PowerShell/DscResource.Kit/blob/master/CONTRIBUTING.md).

## Resources

* **VeeamBackupJob** Controls backup job settings.

### VeeamBackupJob

This resource provides basic management of Veeam Backup Job settings. It creates jobs and configures scheduling, storage options and more.

* **JobName**: The name of the backup job. The resource uses this as the "primary key" for identifying backup job objects.
* **Ensure**: If Ensure is true, the resource creates the job. If false, removes the job.
* **State**: If Enabled, the job is enabled. If Disabled, the job is disabled.
* **Frequency**: None, Daily, Monthly, Periodic, Continuous. Not implemented.
* **StartTime**: Not implemented.
* **CompressionLevel**: None, DedupFriendly, Optimal, High, Extreme. Not implemented.
* **NotificationRecipients**: Not implemented.