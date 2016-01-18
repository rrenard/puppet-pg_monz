#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with pg_monz](#setup)
    * [What pg_monz affects](#what-pg_monz-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with pg_monz](#beginning-with-pg_monz)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Installs and configures pg_monz [http://pg-monz.github.io/pg_monz/index-en.html] on a DB server

## Module Description

The module will download the specified version and configure pg_monz for use with the zabbix agent

## Setup

### What pg_monz affects

Files and directories creates
* /opt/pg_monz - holds the unzipped pg_monz install
* /etc/pg_monz - configs for pgsql and pgpool. pg_monz uses this to connect the service
* /etc/zabbix/zabbix_agentd.d/userparameter_pg_monz.con - User Parameters for zabbix. The defaults will be installed and any additional requirements can be added via the 'userparameter' variable

### Setup Requirements

This module requires zabbix-agent and zabbix-sender to be installed. 
NB: It does not check for these requirements. You must ensure these packages are installed before installing pg_monz

### Beginning with pg_monz

Install the module in puppet

## Usage

Include the class in your setup
```puppet
class { pg_monz:
  vesion => '2.0',
}
```

## Limitations

Tested on RHEL 6/7. 

## Development

PR's welcome



