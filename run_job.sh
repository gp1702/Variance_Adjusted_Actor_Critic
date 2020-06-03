#!/bin/bash


mkdir -p ./out
mkdir -p ./err



runs=$1
envs=$2
dir=$3
expname=$4
script=$5
job_name=$6
mu=$7


for env in "${envs[@]}"
do
	for ((run=1; run<=$runs; run++))
	do
			sbatch -J $job_name.$run ~/VarReducedAc/job_scheduler.sh  $env $run $dir $expname $script $mu
		done
	done
