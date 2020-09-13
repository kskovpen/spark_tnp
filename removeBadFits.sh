#!/bin/bash

while read line; 
do
  rm -rf ${line}
done < badfits.txt

