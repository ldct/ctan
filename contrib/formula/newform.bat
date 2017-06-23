#!/bin/sh
sed "s/atmath/formula/g" %1 > zw1
sed "s/atdiffdef/formuladiff/g" zw1 > zw2
sed "s/atunitdef/formulaunit/g" zw2 > %1
del zw1 zw2
