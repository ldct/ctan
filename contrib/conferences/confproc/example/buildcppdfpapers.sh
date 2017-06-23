#!/bin/sh

cd papers/sources_tex
for i in *; do
  echo '*********' $i '*********'
  cp $i/$i.pdf ..
done
cd ../sources_pdftex
for i in *; do
  echo '*********' $i '*********'
  cp $i/$i.pdf ..
done
