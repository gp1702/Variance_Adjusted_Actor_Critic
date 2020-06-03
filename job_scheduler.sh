#! /bin/env bash

#!/bin/bash
#SBATCH --account=rrg-bengioy-ad           # Yoshua pays for your job
#SBATCH --mem=20G	                      # Ask for 2 GB of RAM
#SBATCH --gres=gpu:0              # Number of GPUs (per node)
#SBATCH --cpus-per-task=1
#SBATCH --time=0-23:00:00                   # The job will run for 3 hours
#SBATCH --mail-user=gandharv.patil@mail.mcgill.ca
#SBATCH --mail-type=FAIL
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --output=./out/%j-%x.out
#SBATCH --error=./err/%j-%x.err

# 1. Create your environement locally
module load python/3.7.4
module load cuda/10.1 cudnn
source ~/rlpyt/bin/activate

path='/home/gandharv/VarReducedAc/'

# Envs: Hopper, HalfCheetah, Walker2d, Ant, Humanoid, HumanoidStandup, Reacher

env=$1
n=$2
dir=$3
expname=$4
script=$5
mu=$6

python $path$script --ENV=$env --name=$n --dir=$dir --exp_name=$expname --mu=$mu
#python /home/gandharv/common-info-ac/working_codes/train_ppo.py --ENV=$env --name=$n --dir=$dir --exp_name=$expname
