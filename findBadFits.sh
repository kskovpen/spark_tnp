#!/bin/bash

fpath="../../www/muon_TagAndProbe/fits_data/muon/generalTracks/Z/Run2016/Nominal/"

chi2=2.0

wplist=$(ls ${fpath})

rm -rf badfits.txt
touch badfits.txt

for wp in ${wplist}; do
  rlist=$(ls ${fpath}/${wp} | grep root)
  echo $wp
  for r in ${rlist}; do
    tr=$(echo ${r} | sed "s%.root%_statTests%g")
    res=$(./readInfo.py ${fpath}/${wp}/${r} ${tr})
    res=$(echo $res | sed "s%.*chi2P%chi2P%g")
    chi2P=$(echo $res | awk '{print $2}')
    chi2F=$(echo $res | awk '{print $4}')
    if [[ ${chi2P} > ${chi2} ]]; then
      echo ${r}": chi2P="${chi2P}
      echo ${fpath}/${wp}/${r} >> badfits.txt
    fi
    if [[ ${chi2F} > ${chi2} ]]; then
      echo ${r}": chi2F="${chi2F}
      if [[ ${chi2P} < ${chi2} ]]; then
        echo ${fpath}/${wp}/${r} >> badfits.txt
      fi
    fi
  done
done

