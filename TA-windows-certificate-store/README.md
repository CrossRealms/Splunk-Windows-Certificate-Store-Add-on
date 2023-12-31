# Windows Certificate Store Add-on for Splunk

### Download from Splunkbase
https://splunkbase.splunk.com/app/7013


OVERVIEW
--------
The Windows Certificate Store Add-on for Splunk allows users to collect the certificate metadata from Windows Certificate Stores and AD's Certificate Authority. It uses the PowerShell script to collect the metadata regarding the certificates available on the Certificate Store of Windows machines and Certificate Authority's Certificate Store. The Add-on does not contain any dashboards or savedsearches.

Install the Cyences App for Splunk (https://splunkbase.splunk.com/app/5351/) to get alerts and dashboards related to the data collected by this Add-on.

* Author - CrossRealms International Inc.
* Creates Index - False
* Compatible with:
   * Splunk Enterprise version: 9.1.x, 9.0.x, 8.2.x
   * OS: Platform Independent
   * Browser: Does not have UI.


## What's inside the App

* No of Custom Inputs: **2**
* No of Static CSV Lookup Files: **1**



TOPOLOGY AND SETTING UP SPLUNK ENVIRONMENT
------------------------------------------
There are two ways to setup this app:
  1. Standalone Mode: 
     * Install the `Windows Certificate Store Add-on`.
  2. Distributed Mode:
     * The Add-on is required on the Search Head for field extraction. Input configuration is not required on the Search Head.
     * Install the `Windows Certificate Store Add-on` on the Universal Forwarders on Windows and configure it. (You could do that from Deployment Server.)
     * Install the Add-on on a heavy forwarder if forwarders are sending data to Heavy Forwarder, otherwise install it on Indexers for data parsing. Input configuration is not required for both indexers and heavy forwarders.


DEPENDENCIES
------------------------------------------------------------
* There are no external dependencies for this Add-on.


INSTALLATION
------------------------------------------------------------
* From the Splunk Home page, click the gear icon next to Apps.
* Click `Browse more apps`.
* Search for `Windows Certificate Store Add-on`.
* Click `Install`.
* If prompted, restart Splunk.


DATA COLLECTION & CONFIGURATION
------------------------------------------------------------
### Enable Data Inputs ###
* Add the following stanzas in `TA-windows-certificate-store/local/inputs.conf` file and deploy it for all required Windows hosts.
```
[powershell://CertStore-CA-Server]
disabled = 0

[powershell://CertStore-Local-Windows-Machine]
disabled = 0
```

* The will be collected under `wincerts` index, hence ensure your Indexers or Standalone machine has that index created.



UNINSTALL ADD-ON
-------------
1. SSH to the Splunk instance.
2. Navigate to apps ($SPLUNK_HOME/etc/apps).
3. Remove the `TA-windows-certificate-store` folder from the `apps` directory.
4. Restart Splunk.


RELEASE NOTES
-------------
Version 1.0.1 (September 2023)
* Fixed the ssl_end_time and ssl_subject field extraction issue.

Version 1.0.0 (August 2023)
* Created Add-on with Powershell script and required configuration to collect the data.



OPEN SOURCE COMPONENTS AND LICENSES
------------------------------
* N/A


CONTRIBUTORS
------------
* Vatsal Jagani
* Mahir Chavda
* Hardik Dholariya



SUPPORT
-------
* Contact - CrossRealms International Inc.
  * US: +1-312-2784445
* License Agreement - https://d38o4gzaohghws.cloudfront.net/static/misc/eula.html
* Copyright - Copyright CrossRealms Internationals, 2023

