#!/bin/bash
hosting_directory='/home/hosting/projects/hosting'

for folder in api backup.db1 backup.db2 db1 db2 dbmain hw tasks tasks4 ; do
  for folder1 in build cms common dep ext plugins scripts sites wdc ; do
  
    ln -s $hosting_directory/build/$folder1/ $hosting_directory/$folder/
  
  done
done    