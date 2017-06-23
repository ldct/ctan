#!/bin/sh
 
for i in default infolines sidebar tree ; do (
   for j in magpie cormorant frigatebird; do
      lualatex \\def\\outername\{"$i"\}\\def\\colorname\{"$j"\}\\input example.tex;
      mv example.pdf ${j}example"$i".pdf; 
   done )
done
