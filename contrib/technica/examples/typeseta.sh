set -e
./typeset.sh $1 aminta.tex     # Italian
./typeset.sh $1 antocleo.tex
./typeset.sh $1 barbier.tex    # French
./typeset.sh $1 caesar.tex     # Latin
./typeset.sh $1 carmina.tex    # Latin
./typeset.sh $1 cyrano.tex     # French
./typeset.sh $1 dcarlos.tex    # German
./typeset.sh $1 earnest.tex
./typeset.sh $1 faust.tex      # German
./typeset.sh $1 fleurs.tex     # French
./typeset.sh $1 foscolo.tex    # Italian
./typeset.sh $1 hamlet.tex
./typeset.sh $1 harold.tex
./typeset.sh $1 juancruz.tex   # Spanish
./typeset.sh $1 lavida.tex     # Spanish
./typeset.sh $1 leaves.tex
./typeset.sh $1 mariner.tex
./typeset.sh $1 metapoet.tex
./typeset.sh $1 paradise.tex
./typeset.sh $1 phedre.tex     # French
./typeset.sh $1 plato.tex      # Greek
./typeset.sh $1 polizian.tex   # Italian
./typeset.sh $1 pythian7.tex   # Greek
./typeset.sh $1 septem.tex     # Greek
./typeset.sh $1 sonnets.tex
./typeset.sh $1 stoops.tex
./typeset.sh $1 tempest.tex
./typeset.sh $1 woyzeck.tex    # German
./typeset.sh $1 lgs.tex
wc  aminta.tex \
 antocleo.tex \
 barbier.tex \
 caesar.tex \
 carmina.tex \
 cyrano.tex \
 dcarlos.tex \
 earnest.tex \
 faust.tex \
 fleurs.tex \
 foscolo.tex \
 hamlet.tex \
 harold.tex	\
 juancruz.tex \
 lavida.tex \
 leaves.tex \
 mariner.tex \
 metapoet.tex \
 paradise.tex \
 phedre.tex \
 plato.tex \
 polizian.tex \
 pythian7.tex \
 septem.tex \
 sonnets.tex \
 stoops.tex \
 tempest.tex \
 woyzeck.tex \
 lgs.tex 
echo
echo Elapsed time: $SECONDS	seconds
