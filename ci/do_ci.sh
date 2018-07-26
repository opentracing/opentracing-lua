#!/bin/bash

set -e

function run_lua_test()
{
  ./ci/install_lua.sh
  ./ci/install_rocks.sh
  luarocks install opentracing-scm-0.rockspec
  busted test/noop.lua
}

if [[ "$1" == "test-5.3" ]]; then
  export LUA_VERSION=5.3.4
  run_lua_test
  exit 0
elif [[ "$1" == "test-5.2" ]]; then
  export LUA_VERSION=5.2.4
  run_lua_test
  exit 0
elif [[ "$1" == "test-5.1" ]]; then
  export LUA_VERSION=5.1.5
  run_lua_test
  exit 0
fi
