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
  :
}

function tearDown() {
  rm -rf ${target_dir}
}

function test_vagrant_cli() {
  vagrant_cli ${target_dir}
  assertEquals 0 ${?}
}

## shunit2

. ${shunit2_file}
