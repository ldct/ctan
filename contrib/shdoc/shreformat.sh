#!/bin/bash

# experimental formatting script to pre-format shell output that is read by
# the LaTeX package 'shdoc' (see ctan.org/pkg/shdoc)

# 1. read from shrun.tmp and substitute double tabs with two spaces
#                           2. substitute single tabs with single spaces
#                                           3. remove all leading spaces and save the output to shrun-formatted.tmp
sed 's/\t\t/  /' <shrun.tmp | sed 's/\t/ /' | sed -e 's/^[ \t]*//' >shrun-formatted.tmp
