#!/bin/bash

LOCALROOT=/fasttmp/wtobin/develop/nightly
REMOTEROOT=/gpfs/u/home/PASC/PASCtbnw/barn-shared
REMOTEUSER=PASCtbnw@lp03.ccni.rpi.edu

if [ "$1" == "push" ] ; then
  rsync -ravzhe ssh --exclude=".*/" $LOCALROOT/amsi/ $REMOTEUSER:$REMOTEROOT/amsi/
  rsync -ravzhe ssh --exclude=".*/" --exclude="doc/*" --exclude="*/meshes/*" --exclude="*Benchmark/*" --exclude="*Indentation/*" $LOCALROOT/biotissue/ $REMOTEUSER:$REMOTEROOT/bio/
  rsync -ravzhe ssh --exclude=".*/" $LOCALROOT/scripts/ $REMOTEUSER:$REMOTEROOT/scripts/
elif [ "$1" == "pull" ] ; then
  rsync -ravxhe ssh --exclude=".*/" --exclude="*build*/" $REMOTEUSER:$REMOTEROOT/amsi/ $LOCALROOT/amsi/
  rsync -ravxhe ssh --exclude=".*/" --exclude="*build*/" --exclude="dep/*" --exclude="doc/*" $REMOTEUSER:$REMOTEROOT/bio/ $LOCALROOT/biotissue/
fi
