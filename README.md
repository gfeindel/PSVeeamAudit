# PSVeeamAudit
The PSVeeamAudit project is a humble attempt to avoid backup configuration drift in Veeam. Have you ever modified a backup job during troubleshooting and forgot to correct the change? Backup job configuration drift can lead to violated SLAs and data loss. 

## How it works
PSVeeamAudit consists of an auditing script and templates. Templates define correct job configurations. Templates include common parameters such as job name convention, scheduling, and retention. The audit script compares real job configurations against the template. This concept applies equally well for any backup product. We are focused on Veeam, because we use Veeam. In the future, we hope this project expands to include other backup products, too.

## PSVeeam Audit and DSC
You might think, "This sounds like DSC for Veeam." You'd be right. We hope to get there. This is a first attempt and learning experience on the way to a Veeam DSC resource that will benefit the entire IT community!
