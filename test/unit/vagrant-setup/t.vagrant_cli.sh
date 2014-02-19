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
  function vagrant_deploy() { echo vagrant_deploy "${@}"; }
  function vagrant_setup_git() { echo vagrant_setup_git "${@}"; }
}

function tearDown() {
  :
}

function test_vagrant_cli_no_opts() {
  vagrant_cli
  assertEquals 0 ${?}
}

function test_vagrant_cli_opts() {
  vagrant_cli ${target_dir}
  assertEquals 0 ${?}
}

## shunit2

. ${shunit2_file}
