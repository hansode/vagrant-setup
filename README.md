vagrant-setup
=============

[![Build Status](https://travis-ci.org/hansode/vagrant-setup.png)](https://travis-ci.org/hansode/vagrant-setup)

Requirements
------------

+ bash (http://www.gnu.org/software/bash/)
+ make (http://www.gnu.org/software/make/)
+ rsync (http://rsync.samba.org/)

Installation
------------

```
$ git clone https://github.com/hansode/vagrant-setup.git
```

Usage
-----

```
$ vagrant-setup <project-name>
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
```

Shell Provisioner Based Vagrant Workflow
----------------------------------------

### Folder Structure

```
project/
|
+- README.md
|
+- Vagrantfile
|
+- bootstrap.sh # Bootstrapping: package installation (phase:1)
|
+- config.d/ # Configuration: system configuration
|  +- base.sh        # Configuration: node-common   (phase:2)
|  +- ${hostname}.sh # Configuration: node-specific (phase:2.5)
|
+ files/ # TODO
```

### Vagrantfile

```
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hansode/centos-6.5-x86_64"

  config.vm.provision "shell", path: "bootstrap.sh"     # Bootstrapping: package installation (phase:1)
  config.vm.provision "shell", path: "config.d/base.sh" # Configuration: node-common          (phase:2)

  config.vm.define "node01" do |node|
    node.vm.hostname = "node01"
    node.vm.provision "shell", path: "config.d/#{node.vm.hostname}.sh" # Configuration: node-specific (phase:2.5)
  end
end
```

### bootstrap.sh

```
#!/bin/bash
#
# requires:
#  bash
#
set -e
set -o pipefail
set -x

function yum() {
  $(type -P yum) --disablerepo=updates "${@}"
}

# Add installation packages ...
addpkgs="
"

if [[ -n "$(echo ${addpkgs})" ]]; then
  yum install -y ${addpkgs}
fi
```

### config.d/base.sh

```
#!/bin/bash
#
# requires:
#  bash
#
set -e
set -o pipefail
set -x

# Do some changes ...
```

### config.d/node01.sh

```
#!/bin/bash
#
# requires:
#  bash
#
set -e
set -o pipefail
set -x

# Do some changes ...
```

Contributing
------------

1. Fork it ( https://github.com/[my-github-username]/vagrant-setup/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

License
-------

[Beerware](http://en.wikipedia.org/wiki/Beerware) license.

If we meet some day, and you think this stuff is worth it, you can buy me a beer in return.
