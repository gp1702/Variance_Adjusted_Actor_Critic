#!/bin/bash


runs=20
env='Hopper-v2'
dir='Hopper_Mu_0.05'
#dir='GRU/Elu/Ctrl-share/Mlp-v/'
#dir='Mlp-Baseline/Elu/'
exp_name='Hopper.20'
script='train_ppo.py'
mu=0.05
#script='MLP_Baseline/train_ppo.py'
job_name='Hopper-vaac'



bash run_job.sh $runs $env $dir $exp_name $script $job_name $mu
