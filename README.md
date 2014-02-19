vagrant-setup
=============

[![Build Status](https://travis-ci.org/hansode/vagrant-setup.png)](https://travis-ci.org/hansode/vagrant-setup)

Requirements
------------

+ [bash](http://www.gnu.org/software/bash/)
+ [make](http://www.gnu.org/software/make/)

Installation
------------

```
$ git clone https://github.com/hansode/vagrant-setup.git
```

Usage
-----

```
$ vagrant-setup <box-name>
```

Getting Started
---------------

```
$ cd /path/to/dir
$ vagrant-setup testing-box

sending incremental file list
created directory testing-box
./
Vagrantfile
bootstrap.sh
config.d/
config.d/base.sh
config.d/node01.sh

sent 1860 bytes  received 95 bytes  3910.00 bytes/sec
total size is 1511  speedup is 0.77
Initialized empty Git repository in /path/to/dir/testing-box/.git/
```
