#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

## functions

function setUp() {
  function rsync() { echo rsync "${@}"; }
}

function tearDown() {
  :
}

function test_vagrant_deploy_no_opts() {
  vagrant_deploy >/dev/null
  assertNotEquals 0 ${?}
}

function test_vagrant_deploy_opts() {
  vagrant_deploy ${target_dir} >/dev/null
  assertEquals 0 ${?}
}

## shunit2

. ${shunit2_file}
