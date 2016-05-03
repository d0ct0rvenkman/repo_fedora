# repo_fedora
[![Build Status](https://travis-ci.org/lbayerlein/repo_fedora.svg?branch=master)](https://travis-ci.org/lbayerlein/repo_fedora)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with repo_fedora](#setup)
    * [What repo_fedora affects](#what-repo_fedora-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with repo_fedora](#beginning-with-repo_fedora)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)

## Overview

repo_fedora is a modul for managing your repositories on your Fedora desktop. Successfully tested with Puppet 4.

## Module Description

If applicable, this section should have a brief description of the technology
the module integrates with and what that integration enables. This section
should answer the questions: "What does this module *do*?" and "Why would I use
it?"
You can give this module the right, to clean your /etc/yum.repos.d directory and activate some listed repos for your packages. Here you can activate:

* Fedora
* Fedora Update
* Fedora Update Testing
* Adobe
* Bumblebee
* Bumblebee nonfree
* Mediaelch
* Google Chrome
* Playonlinux
* rpmfusion free
* rpmfusion nonfree

## Setup

### What repo_fedora affects

* Install *.repo files
* Clean /etc/yum.repos.d

### Setup Requirements **OPTIONAL**

You need to install stdlib to manage your repositories.

### Beginning with repo_fedora

The very basic steps needed for a user to get the module up and running.

If your most recent release breaks compatibility or requires particular steps
for upgrading, you may wish to include an additional section here: Upgrading
(For an example, see http://forge.puppetlabs.com/puppetlabs/firewall).

## Usage

Include repo_fedora in your structure

```
  include repo_fedora
```

In yaml, you can handle it like
```
  ---
  repo_fedora::adobe: true
  repo_fedora::playonlinux: true
```
