#!/bin/bash
#
# requires:
#  bash
#
set -e
set -o pipefail
set -x

# Do some changes ...

user=${user:-vagrant}

su - ${user} -c "bash -ex" <<'EOS'
  whoami
EOS
