#!/bin/bash
#$ -V
#$ -cwd
#$ -j y
#$ -o $JOB_ID_spades.log

echo $HOSTNAME
echo $PREFIX
echo $F1 $R1
echo $F2 $R2
echo $F3 $R3

mkdir -p /scratch/aworonik/spades/$PREFIX

/ceph/software/spades/SPAdes-3.11.1-Linux/bin/spades.py \
--only-assembler \
-k 21,33,55,77,99 \
-o /scratch/aworonik/spades/$PREFIX \
--pe1-1 $F1 \
--pe1-2 $R1 \
--pe2-1 $F2 \
--pe2-2 $R2 \
--pe3-1 $F3 \
--pe3-2 $R3 \
-t $NSLOTS

rsync -av /scratch/aworonik/spades/$PREFIX .

