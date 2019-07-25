#!/bin/bash

PREFIX="/tmp/haplogrep" ;
WORKDIR="/tmp/work" ;

if [ ! -e ${WORKDIR} ] ; then mkdir ${WORKDIR}; fi ;
OUTDIR="${WORKDIR}/haplogrep" ;
if [ ! -e ${OUTDIR} ] ; then mkdir ${OUTDIR}; fi ;

WRKFILE="${2}" ; 

cd ${WORKDIR} ;
BASE="$(basename ${WRKFILE} .txt)" ;

echo "Converting..."
bcftools convert --tsv2vcf ${WORKDIR}/${BASE}.txt -f ${PREFIX}/Homo_sapiens.GRCh37.dna.primary_assembly.fa -s ${BASE} -Ob -o ${BASE}.vcf.gz -O z

cd ${PREFIX} ;
java -jar haplogrep-2.1.24.jar --in ${WORKDIR}/${BASE}.vcf.gz --format vcf --out ${BASE}_haplogroups.txt --lineage > haplogrep.log 
dot ${BASE}_haplogroups.dot -Tpng > ${BASE}_haplogroups.png

mv ${PREFIX}/${BASE}* ${OUTDIR}/;
