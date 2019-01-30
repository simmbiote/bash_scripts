#!/usr/bin/env bash

# Runs on a file (ie. db_export.sql), and overwrites it.

sed -i 's/somthing.com/somethingelse.com/g' db_export.sql
