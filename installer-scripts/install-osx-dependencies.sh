#!/usr/bin/env bash

files_to_copy=(
  "${HOME}/Git/aXel/data"
  "${HOME}/Git/aXel/lib"
  "${HOME}/Git/aXel/resources"
  "${HOME}/Git/aXel/tmp"
)

mkdir "${HOME}/Git/aXel/Builds - aXel.rbp/Mac OS X (Intel)/aXel.app/Contents/Resources/Payload"

for i in "${files_to_copy[@]}"
do
  cp -r $i "${HOME}/Git/aXel/Builds - aXel.rbp/Mac OS X (Intel)/aXel.app/Contents/Resources/Payload"
done